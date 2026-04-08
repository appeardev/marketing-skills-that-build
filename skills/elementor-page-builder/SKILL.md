---
name: elementor-page-builder
description: Use when building, editing, or managing WordPress pages with Elementor via Claude Code MCP tools. Covers page creation, content editing, template workflows, and the critical import-template pattern for making content editable in Elementor's visual editor.
---

# Elementor with Claude Code

## Overview

The Elementor MCP server exposes WordPress/Elementor page-building tools to Claude Code. **Critical pattern:** content created or modified via MCP must go through Elementor's import pipeline (`import-template`) to be fully editable in Elementor's visual editor.

## When to Use

- Building new WordPress pages with Elementor
- Editing existing Elementor page content (text, images, styles)
- Creating page translations (e.g., WPML `/es/` pages)
- Exporting page structures for reuse or translation
- Managing global design tokens (colors, typography)

## Critical Workflow: Import-Template Pattern

**Problem:** Pages created via `create-page` or `build-page` may not render properly in Elementor's visual editor without going through Elementor's internal import process.

**Solution:** Use `export-page` + `import-template` to ensure content is editable:

```
1. Build content → export-page (get JSON) → create new page → import-template (paste JSON into new page)
```

This ensures Elementor processes the content through its own import pipeline, generating proper internal IDs and metadata.

### Translation Workflow (WPML)

For creating translated pages (e.g., English → Spanish):

1. **Export** the source page: `export-page` → save JSON
2. **Create translation** in WP Admin via WPML (click "+" on the language column)
3. **Import** the exported JSON into the new translated page: `import-template`
4. **Edit** text content in the translated page using `update-widget` / `batch-update` / `find-element`

## Tool Quick Reference

### Discovery & Reading

| Tool | Purpose |
|------|---------|
| `list-pages` | Find all Elementor pages (filter by type/status) |
| `get-page-structure` | View element tree (IDs, types, nesting) |
| `find-element` | Search by widget type, text content, or setting |
| `get-element-settings` | Read all settings for a specific element |
| `get-widget-schema` | Discover available settings for a widget type |
| `list-widgets` | List all registered widget types |
| `list-templates` | List saved Elementor templates |
| `get-global-settings` | Read site-wide design tokens |

### Creating Pages & Content

| Tool | Purpose |
|------|---------|
| `create-page` | Create blank Elementor page |
| `build-page` | Create complete page from declarative structure |
| `import-template` | **Import JSON structure into existing page (preferred for editability)** |
| `add-container` | Add flex/grid container (layout wrapper) |
| `add-heading` | Add heading widget (h1-h6) |
| `add-text-editor` | Add rich text widget (HTML content) |
| `add-button` | Add button with link, colors, typography |
| `add-image` | Add image widget (needs url/id) |
| `add-stock-image` | Search + download + add image in one step |
| `add-icon-box` | Icon + title + description card |
| `add-video` | YouTube, Vimeo, or self-hosted video |
| `add-html` | Raw HTML widget |
| `add-custom-js` | JavaScript injection via HTML widget |

### Editing Existing Content

| Tool | Purpose |
|------|---------|
| `update-widget` | Merge settings into a widget |
| `update-container` | Merge settings into a container |
| `update-element` | Update any element (container or widget) |
| `batch-update` | Update multiple elements in one save |
| `move-element` | Move element to new parent/position |
| `reorder-elements` | Reorder children within a container |
| `duplicate-element` | Clone element with fresh IDs |
| `remove-element` | Delete element and children |
| `delete-page-content` | Clear all content from a page |

### Templates & Export

| Tool | Purpose |
|------|---------|
| `export-page` | Export page as JSON (for reuse/translation) |
| `save-as-template` | Save page/element as reusable template |
| `apply-template` | Insert saved template into a page |
| `import-template` | Import raw JSON structure into a page |

### Global Design

| Tool | Purpose |
|------|---------|
| `update-global-colors` | Update site-wide color palette |
| `update-global-typography` | Update site-wide font settings |
| `update-page-settings` | Update page-level settings (background, etc.) |

### Images

| Tool | Purpose |
|------|---------|
| `search-images` | Search Openverse for CC-licensed images |
| `sideload-image` | Download external image to Media Library |
| `add-stock-image` | Search + download + add in one step |
| `upload-svg-icon` | Upload SVG to Media Library |

## Common Patterns

### Edit Text on Existing Page

```
1. find-element (search_text="old text") → get element_id
2. update-widget (element_id, {title: "new text"})
```

### Clone a Page for Translation

```
1. export-page (source post_id) → get JSON structure
2. Create translated page in WP Admin (WPML)
3. import-template (new post_id, template_json=exported JSON)
4. find-element + update-widget to translate each text element
5. batch-update for efficiency when changing multiple elements
```

### Build a Page from Scratch

> **See "Critical Learnings" section below for the recommended reliable workflow.**

```
1. Check existing page format: get-page-structure on any existing page
2. search-images / sideload-image → get image URLs first
3. create-page (blank page, draft status)
4. import-template section by section (position: -1 to append)
5. get-page-structure to verify each import
6. update-page-settings to publish when ready
```

**Avoid `build-page`** — it creates pages that may not render properly because content doesn't go through Elementor's internal import pipeline. Use `import-template` instead.

### Layout Rules (Container Format — build-page)

These rules apply when the site uses **container-based layout** (Flexbox Containers enabled):

- Side-by-side columns: parent container with `flex_direction=row`
- **Never** set `flex_wrap` or `_flex_size` — causes overflow
- Background: `background_background=classic` + `background_color=#hex`
- Background image: `background_background=classic` + `background_image={url,id}` + `background_size=cover`

For **section/column format** layout rules, see "Critical Learnings > Section/Column Format Reference" below.

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Content not editable in Elementor editor | Use `import-template` instead of direct `create-page` with content |
| Can't find element to edit | Use `get-page-structure` first to see all IDs, then `find-element` |
| Layout overflow on build-page | Remove `flex_wrap` and `_flex_size` from settings |
| Images not loading | Use `sideload-image` to import to Media Library first, then use the returned `id` and `url` |
| Typography not applying | Set `typography_typography=custom` before other typography settings |
| Page renders blank or broken | Used `build-page` instead of `import-template`; rebuild using the import-template workflow |
| Containers not rendering | Site uses section/column format but content was built with `elType: "container"`; check format first |
| `get-page-structure` returns empty | Page was built with `build-page`; content not properly persisted — rebuild via `import-template` |

## Critical Learnings

### Container vs Section/Column Format

The Elementor MCP tools support two page formats:

- **Container-based** (newer): Uses `elType: "container"` with nested containers for layout. Requires Elementor's experimental "Flexbox Container" feature to be enabled.
- **Section/Column-based** (older): Uses `elType: "section"` with `elType: "column"` children. This is the default format for most WordPress installs.

**How to detect which format the site uses:** Call `get-page-structure` on an existing page. If elements have `elType: "section"` and `elType: "column"`, the site uses the older format. If elements have `elType: "container"`, containers are enabled.

**IMPORTANT:** Always check the existing page format BEFORE building. Using containers on a site that only supports sections will create pages that don't render.

### build-page vs import-template (CRITICAL)

- `build-page` creates pages that may **NOT** render properly — content doesn't go through Elementor's internal import pipeline
- `import-template` processes content through Elementor's import pipeline, generating proper internal IDs and metadata
- **Always use this workflow:**
  1. `create-page` to create a blank page (or use an existing page)
  2. `import-template` to add content section by section
  3. Verify with `get-page-structure` — if elements appear with proper IDs, the import worked

### get-page-structure Limitations

- Returns empty `structure: []` for pages built with `build-page` (content not properly persisted)
- Works correctly for pages built via `import-template` or the Elementor visual editor
- Use this as a verification tool: if structure is empty after import, something went wrong

### Section/Column Format Reference

When the site uses section/column format, structure elements like this:

```json
{
  "elType": "section",
  "settings": {
    "layout": "full_width",
    "padding": {"top": "80", "bottom": "80", "left": "40", "right": "40", "unit": "px", "isLinked": false},
    "background_background": "classic",
    "background_color": "#1a1a2e"
  },
  "elements": [
    {
      "elType": "column",
      "settings": {"_column_size": 100},
      "elements": [
        {"elType": "widget", "widgetType": "heading", "settings": {"..."}}
      ]
    }
  ]
}
```

Key rules for section/column format:
- Use `_column_size: 100` for full width, `50` for 2-col, `33` for 3-col, `25` for 4-col
- Side-by-side layout: multiple columns in one section (NOT `flex_direction`)
- For complex grids (like card grids), use an HTML widget with inline CSS grid instead of trying to nest sections

### Recommended Page Building Workflow

```
1. Check existing page format (get-page-structure on any existing page)
2. create-page (blank page, draft status)
3. import-template section by section (position: -1 to append)
4. get-page-structure to verify each import
5. update-page-settings to publish when ready
```

This is the **ONLY** reliable way to create Elementor pages via MCP that will both render correctly AND be editable in the Elementor visual editor.
