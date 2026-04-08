# Marketing Skills That Build

**Marketing skills for Claude Code that actually build things.**

Other marketing skill repos give you strategy prompts and copywriting tips. These skills use MCP tools to **create real pages, import real data, and build real sites** — right from your terminal.

| Skill | What It Actually Does |
|-------|----------------------|
| **Elementor Page Builder** | Builds and edits WordPress pages through Elementor's MCP tools |
| **Programmatic SEO** | Generates hundreds of SEO pages from a CSV using WP All Import + Elementor |
| **Multilingual Marketing** | Translates entire pages to any language via WPML export/import workflows |

## Why This Exists

Most AI marketing skills tell Claude *what to think about*. These skills tell Claude *how to do the work*:

- `elementor-page-builder` doesn't explain page design theory — it builds an actual Elementor page via MCP, section by section, with proper import-template patterns that actually render
- `programmatic-seo` doesn't explain what pSEO is — it walks through the full pipeline from CSV data to WP All Import to hundreds of live pages with dynamic Elementor templates
- `multilingual-marketing` doesn't list translation tips — it exports a page, imports the structure into a WPML translation, and batch-updates every text element to the target language

**If a skill doesn't produce a tangible output, it doesn't belong here.**

## Installation

### Claude Code Plugin (Recommended)

```bash
claude plugin install marketing-skills-that-build
```

Skills are available as:
- `/marketing-skills-that-build:elementor-page-builder`
- `/marketing-skills-that-build:programmatic-seo`
- `/marketing-skills-that-build:multilingual-marketing`

### Quick Install (Manual)

```bash
curl -sL https://raw.githubusercontent.com/appeardev/marketing-skills-that-build/main/install.sh | bash
```

Or clone and install:

```bash
git clone https://github.com/appeardev/marketing-skills-that-build.git
cd marketing-skills-that-build
./install.sh
```

### Project-Specific

Copy the `skills/` directory you need into your project's `.claude/skills/` folder.

## Skills

### Elementor Page Builder

Build and edit WordPress pages using Elementor's MCP tools from Claude Code.

**Key capabilities:**
- Create pages using the reliable `import-template` pattern (not `build-page`)
- Auto-detect section/column vs container format
- Edit existing pages — find elements, update text, swap images
- Export pages as reusable JSON templates
- 40+ tool reference organized by category

**Requires:** WordPress + Elementor + [Elementor MCP plugin](https://github.com/flavor-dev/flavor-elementor-mcp) or WordPress MCP Adapter

### Programmatic SEO

Generate hundreds of targeted landing pages from structured CSV data using WP All Import Pro and Elementor.

**The pipeline:**
```
CSV data → WP All Import Pro → WordPress pages + ACF fields → Elementor template with Dynamic Tags → Published pages
```

**What you get:**
- CSV template with all columns for competitor alternative pages
- Step-by-step ACF field group setup
- Elementor template design with 8 sections and dynamic content
- WP All Import configuration with re-import support (add/update without duplicates)
- Expandable to industry pages, integration pages, and location pages

**Requires:** WordPress + Elementor Pro + WP All Import Pro + ACF

### Multilingual Marketing

Translate WordPress marketing pages to any language using WPML and Elementor MCP tools.

**The workflow:**
```
Source page (EN) → Export JSON → Create WPML translation → Import template → Batch-translate text → Live translated page (/es/, /fr/, /pt/)
```

**What you get:**
- Full translation workflow from export to verified live page
- Batch translation process for multiple pages
- Multilingual SEO checklist (hreflang, translated slugs, localized meta)
- Support for 65+ languages including RTL

**Requires:** WordPress + Elementor + WPML

## Prerequisites

All skills require:
- [Claude Code](https://claude.ai/code) CLI
- WordPress site with Elementor
- Elementor MCP tools configured (via [Elementor MCP plugin](https://github.com/flavor-dev/flavor-elementor-mcp) or WordPress MCP Adapter)

Individual skills have additional requirements listed in their documentation.

## Philosophy

1. **Skills that build > skills that advise.** Every skill in this repo produces a tangible output — a page, a dataset, a translation. No strategy decks.
2. **MCP-native.** These skills leverage MCP tools to interact directly with WordPress, Elementor, and other systems. They don't just generate prompts.
3. **Battle-tested.** Every pattern here was discovered by building real marketing sites, hitting real bugs, and finding what actually works (like why `import-template` exists instead of `build-page`).

## Contributing

Have a marketing skill that actually builds something? PRs welcome.

**Requirements for new skills:**
- Must produce a tangible output (pages, data, configurations)
- Must include a working workflow, not just advice
- Must document prerequisites and common mistakes
- Follow the existing SKILL.md format with YAML frontmatter

## License

MIT

---

Built by [@jorgediazapps](https://github.com/appeardev) | [Double My Leads](https://doublemyleads.com)
