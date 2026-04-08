# Marketing Skills That Build

Marketing skills for Claude Code that actually build things — real pages, real data imports, real translations, right from your terminal.

**What this does:** Gives Claude Code the knowledge to build WordPress marketing sites end-to-end using MCP tools — including programmatic SEO at scale, multilingual page translations, and the Elementor patterns that prevent blank pages and broken renders.

## What You Get

- **Elementor Page Builder** — Full 40+ tool reference, the `import-template` workflow that actually works, format detection, and common patterns for page building, editing, and cloning
- **Programmatic SEO** — Complete pipeline from CSV data to hundreds of live SEO pages using WP All Import Pro, ACF dynamic fields, and Elementor templates
- **Multilingual Marketing** — Export/import translation workflow for WPML, batch content updates, multilingual SEO checklist (hreflang, translated slugs, localized meta)

## Prerequisites

1. **Claude Code** installed ([claude.ai/code](https://claude.ai/code))
2. **WordPress site with Elementor** and one of these MCP plugins:
   - [WordPress MCP Adapter](https://github.com/WordPress/mcp-adapter) — Official WordPress MCP plugin (includes Elementor abilities) — [Download latest release](https://github.com/WordPress/mcp-adapter/releases)
   - [Elementor MCP](https://github.com/msrbuilds/elementor-mcp) — Dedicated Elementor MCP server — [Download latest release](https://github.com/msrbuilds/elementor-mcp/releases)
3. **Per-skill requirements:**
   - Programmatic SEO: [WP All Import Pro](https://www.wpallimport.com) + [ACF](https://www.advancedcustomfields.com) + Elementor Pro (for Dynamic Tags)
   - Multilingual Marketing: [WPML](https://wpml.org)

## Installation

### Quick Install (one command)

```bash
git clone https://github.com/appeardev/marketing-skills-that-build.git
cd marketing-skills-that-build
bash install.sh
```

### Manual Install

```bash
# Create skill directories
mkdir -p ~/.claude/skills/elementor-page-builder
mkdir -p ~/.claude/skills/programmatic-seo
mkdir -p ~/.claude/skills/multilingual-marketing

# Copy skill files
cp skills/elementor-page-builder/SKILL.md ~/.claude/skills/elementor-page-builder/
cp skills/programmatic-seo/SKILL.md ~/.claude/skills/programmatic-seo/
cp skills/programmatic-seo/competitor-template.csv ~/.claude/skills/programmatic-seo/
cp skills/multilingual-marketing/SKILL.md ~/.claude/skills/multilingual-marketing/
```

### Project-Specific Install

If you only want the skills available in one project:

```bash
# From your WordPress project root
mkdir -p .claude/skills
cp -r skills/* .claude/skills/
```

## How It Works

**You don't need a special prompt.** Once the skill files are in `~/.claude/skills/`, Claude Code automatically detects and uses them whenever you ask it to do related work.

Just open Claude Code and ask naturally:

```
> Build me a landing page with a hero section, pricing cards, and a CTA

> Create 50 competitor alternative pages from this CSV

> Translate my homepage to Spanish

> Edit the heading on my pricing page to say "Simple Pricing"

> Set up programmatic SEO for my SaaS product
```

You can also invoke skills explicitly:

```
/elementor-page-builder
/programmatic-seo
/multilingual-marketing
```

**What changes behind the scenes:** Without these skills, Claude Code will guess at Elementor workflows and create blank, broken pages. With these skills, it automatically:
1. **Detects your site's format** (section/column vs container) before building
2. **Uses `import-template`** instead of `build-page` (prevents blank pages)
3. **Follows proven workflows** for pSEO imports and multilingual translations
4. **Verifies each step** with `get-page-structure` before moving on

## Key Insight: Skills That Build vs Skills That Advise

Most AI marketing skill repos give Claude strategy prompts — "think about your target audience" or "consider these copywriting frameworks." That's advice, not execution.

These skills are different:

- `elementor-page-builder` doesn't explain page design theory — it builds an actual Elementor page via MCP, section by section, with proper import-template patterns that actually render
- `programmatic-seo` doesn't explain what pSEO is — it walks through the full pipeline from CSV data to WP All Import to hundreds of live pages with dynamic Elementor templates
- `multilingual-marketing` doesn't list translation tips — it exports a page, imports the structure into a WPML translation, and batch-updates every text element to the target language

**If a skill doesn't produce a tangible output, it doesn't belong here.**

## What's Inside

| Skill | Sections |
|-------|----------|
| **Elementor Page Builder** | Import-template pattern, 40+ tool reference, common patterns (edit text, clone pages, build from scratch), section/column and container format handling, 8 common mistakes with fixes |
| **Programmatic SEO** | CSV structure and template, ACF field group setup, Elementor template design (8 sections), WP All Import configuration, re-import workflow, SEO checklist, multi-page-type support (competitors, industries, integrations, locations) |
| **Multilingual Marketing** | Full translation workflow (export → import → translate → verify), batch translation for multiple pages, multilingual SEO checklist, 65+ language support including RTL, common mistakes with fixes |

## Contributing

Have a marketing skill that actually builds something? PRs welcome.

**Requirements for new skills:**
- Must produce a tangible output (pages, data, configurations)
- Must include a working workflow, not just advice
- Must document prerequisites and common mistakes
- Follow the existing SKILL.md format with YAML frontmatter

## License

MIT — Use it, share it, modify it.

---

Built by [@jorgediazapps](https://x.com/jorgediazapps) while building [Double My Leads](https://doublemyleads.com) with Claude Code.
