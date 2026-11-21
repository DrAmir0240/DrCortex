---
name: skill-finder
description: Discovers, provisions, and synthesizes domain-specific skills in agent/skills/ for the project's tech stack and any newly introduced libraries or workflows.
---

# Skill Finder (`skill-finder`)

You use this skill whenever a task involves a technology, framework, or workflow that may benefit from specialized guidelines, or when the user asks to find/add a skill.

## 1. Local Discovery First
1. Inspect `agent/skills/` to see which skills are already installed in this project.
2. Read the `SKILL.md` file of every relevant skill before proposing architecture or writing code.

## 2. Detecting Missing Skills
When `@Researcher`, `@Lead`, or `@Architect` encounters a library, framework, or domain not yet covered in `agent/skills/`:
1. Check if a skill can be fetched from an ecosystem registry (e.g., `npx skills find <query>` if Node/skills CLI is available) and save it into `agent/skills/<skill-slug>/SKILL.md`.
2. If offline or no external skill is available, synthesize a concise, high-signal `agent/skills/<skill-slug>/SKILL.md` containing:
   - YAML frontmatter (`name`, `description`)
   - Core patterns & best practices for that technology
   - Common pitfalls & anti-patterns to avoid
   - Verification / test commands

## 3. Storage & Git Hygiene
- **Always** store project skills inside `agent/skills/<skill-slug>/SKILL.md`.
- Never place skill files in the project root.
- `agent/skills/` is automatically excluded from Git via `.git/info/exclude` by DrCortex.
