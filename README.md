<div align="center">

# 🧠 DrCortex

**Model-Agnostic Multi-Agent Software Engineering Orchestration Framework & CLI**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](#license)
[![Python 3.8+](https://img.shields.io/badge/Python-3.8%2B-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![Platform: Linux | macOS | Windows](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-lightgrey)](#1-installation)
[![Zero Dependencies](https://img.shields.io/badge/Dependencies-Zero%20(Stdlib%20Only)-success)](#why-drcortex)

[🇮🇷 نسخه فارسی (Persian README)](./README.fa.md)

</div>

---

**DrCortex** (`dcx`) is a lightweight, zero-dependency, model-agnostic multi-agent orchestration framework and CLI built for AI-native IDEs and coding agents — including **Antigravity IDE**, **Claude Code**, **OpenCode**, and **Codex**.

Instead of letting AI coding assistants improvise, overwrite files uncontrollably, or burn flagship model tokens on boilerplate, DrCortex enforces a disciplined **9-agent engineering squad** fronted by a single point of contact (**`@Envoy`**), a **5-Gate Human-in-the-Loop workflow** audited by **`@Gatekeeper`**, deep zero-ambiguity discovery by **`@Researcher`**, **dynamic 4-tier model routing**, **built-in Skill Finder**, and **strict build circuit breakers**.

---

## 📋 Table of Contents

- [Why DrCortex?](#-why-drcortex)
- [Architecture & Agent Roster](#-architecture--agent-roster)
- [Step-by-Step Getting Started Guide](#-step-by-step-getting-started-guide)
  - [Step 1: Install DrCortex](#step-1-install-drcortex)
  - [Step 2: Global Setup Wizard (`dcx setup`)](#step-2-global-setup-wizard-dcx-setup)
  - [Step 3: Initialize Your Project (`dcx init`)](#step-3-initialize-your-project-dcx-init)
  - [Step 4: Build Features Using the 5-Gate Workflow](#step-4-build-features-using-the-5-gate-workflow)
  - [Step 5: Manage Git Tracking & Status](#step-5-manage-git-tracking--status)
- [CLI Reference](#-cli-reference)
- [Project Workspace Structure](#-project-workspace-structure)
- [Engineering Guardrails & Circuit Breakers](#-engineering-guardrails--circuit-breakers)
- [License](#license)

---

## ✨ Why DrCortex?

- **Single Point of Contact (`@Envoy`):** Talk to one persona in chat. `@Envoy` silently coordinates `@Researcher`, `@Lead`, `@Architect`, `@Gatekeeper`, `@Backend`, `@Frontend`, `@Reviewer`, `@Ops`, and any custom project agents.
- **Zero-Ambiguity Discovery (`@Researcher`):** Before proposing architecture for a new feature, `@Researcher` asks structured clarifying questions via `@Envoy` until zero ambiguity remains.
- **Human-Gate Enforcement (`@Gatekeeper`):** Dedicated auditor that blocks premature execution and verifies explicit user approval and exit criteria at every human gate.
- **Built-in Skill Finder & Always-Ignored Skills (`agent/skills/`):** Automatically provisions stack-specific skills during `dcx init` (including custom tech stacks) and keeps `agent/skills/` excluded from Git via `.git/info/exclude`.
- **Extensible Custom Agents (`dcx agent add`):** Add project-specific agents in `agent/agents/` that `@Envoy` automatically discovers and orchestrates.
- **Model-Agnostic 4-Tier Routing:** Configure 1 to 4 models ordered from strongest to fastest (e.g., `Neon > Argon > Hydrogen > Flash 3.8` or `Opus > Sonnet > Haiku`). Routine tasks automatically route to faster/cheaper tiers, with an **80% Quota Shield (`ECO_MODE`)**.
- **Zero-Clutter Root & Safe Migration:** Keeps your repository clean with only `AGENT.md`, `agent/`, and `reports/`. Safely backs up and migrates existing `CLAUDE.md`, `.cursorrules`, or `AGENT.md` setups.
- **Cross-Platform & Zero Dependencies:** Uses Python 3 standard library only — runs on **Linux**, **macOS**, and **Windows**.

---

## 🏗️ Architecture & Agent Roster

```text
User ──▶ @Envoy (Single Point of Contact)
           ├── @Researcher ──▶ Deep discovery; asks questions until zero ambiguity remains
           ├── @Lead       ──▶ Requirements analysis, edge-case resolution
           ├── @Architect  ──▶ System design, DB schema/ERD, api-contract.yaml
           ├── @Gatekeeper ──▶ Human-gate auditor; enforces hard stops & approvals
           ├── @Reviewer   ──▶ Security audit, N+1 detection, type safety, tests
           ├── @Backend    ──▶ Server-side logic, services, repositories, jobs
           ├── @Frontend   ──▶ UI components, state management, API integration
           ├── @Ops        ──▶ Builds, test runner, CI/Docker, final step reports
           └── agent/agents/*.md ──▶ Custom project agents added via `dcx agent add`
```

| Role | Default Tier | Responsibility |
| :--- | :--- | :--- |
| **`@Envoy`** | Tier 1 (Flagship) | User interface, synthesis, workflow orchestration, quota tracking |
| **`@Researcher`** | Tier 1 (Flagship) | Deep discovery; asks clarifying questions via `@Envoy` until zero ambiguity |
| **`@Lead`** | Tier 1 (Flagship) | Requirements breakdown and edge-case resolution |
| **`@Architect`** | Tier 1 (Flagship) | Architecture, database schemas, and API contracts |
| **`@Gatekeeper`** | Tier 2 (High Reasoning) | Human-gate auditor: enforces hard stops and exit criteria |
| **`@Reviewer`** | Tier 1 (Flagship) | Code gatekeeper: security, typing, N+1 queries, and test authoring |
| **`@Backend`** | Tier 3 (Balanced) | Backend services, endpoints, and database queries |
| **`@Frontend`** | Tier 3 (Balanced) | Frontend components, state, and contract integration |
| **`@Ops`** | Tier 4 (Fast/Eco) | Build/test execution and closure report generation |

---

## 🚀 Step-by-Step Getting Started Guide

Follow these 5 steps in order to set up DrCortex globally and run your first agentic development cycle.

### Step 1: Install DrCortex

Run the one-line installer for your operating system. No manual `git clone` is required.

**Linux / macOS:**
```bash
curl -fsSL https://raw.githubusercontent.com/DrAmir0240/DrCortex/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/DrAmir0240/DrCortex/main/install.ps1 | iex
```

<details>
<summary>Alternative: Install from a local clone</summary>

```bash
git clone https://github.com/DrAmir0240/DrCortex.git
cd DrCortex
./install.sh        # Linux / macOS
# or .\install.ps1  # Windows PowerShell
```

</details>

> **What this does:** Installs DrCortex into `~/.drcortex` (or `%USERPROFILE%\.drcortex` on Windows), adds `drcortex` and its short alias `dcx` to your `PATH`, and automatically launches the Global Setup Wizard (`dcx setup`).

---

### Step 2: Global Setup Wizard (`dcx setup`)

Immediately after installation (or anytime you run `dcx setup`), the wizard configures your AI IDE and model hierarchy:

1. **Select your primary AI coding environment:**
   - `[1]` **Antigravity IDE** (`~/.gemini/antigravity/GEMINI.md`)
   - `[2]` **Claude Code** (`~/.claude/CLAUDE.md`)
   - `[3]` **Universal / OpenCode / Codex** (`~/.config/drcortex/GLOBAL_RULES.md`)
   - `[4]` **Custom path** (enter any global rules file path)
2. **Enter the number of models you have access to (`1` to `4`).**
3. **Name your models from strongest to lightest** (e.g., Tier 1 Flagship → Tier 4 Fast/Eco).

DrCortex saves your preferences to `~/.drcortex/config.json` and renders the global orchestration rules into your chosen IDE's rules file.

---

### Step 3: Initialize Your Project (`dcx init`)

Navigate to the root of any software project and run:

```bash
cd /path/to/your-project
dcx init
```

The initializer walks you through:

1. **Legacy Setup Detection (if applicable):** If `AGENT.md`, `CLAUDE.md`, `.cursorrules`, `agent/`, or `reports/` already exist, choose:
   - `[1]` **Migrate & Merge** — Backs up existing files to `agent/.internal/backup-legacy/<timestamp>/`, preserves step folders, and appends your legacy rules into `agent/development-policy.md`.
   - `[2]` **Coexist** — Leaves existing files untouched and only adds missing DrCortex files.
   - `[3]` **Fresh Overwrite** — Backs up existing files and installs clean DrCortex templates.
2. **Tech Stack Policy & Default Skills:**
   - `[1]` `python-nextjs` (Full-Stack: FastAPI/Django + Next.js/TypeScript)
   - `[2]` `python-only` (Python Backend)
   - `[3]` `generic` (Language-agnostic Clean Architecture & SOLID)
   - `[4]` `custom` — Enter any custom stack (e.g. `Go + React + PostgreSQL`). Skill Finder automatically provisions matching default skills into `agent/skills/`.
3. **Git Tracking Preference:**
   - Choose **`Y`** to track `AGENT.md`, `agent/`, and `reports/` in Git with your team (`agent/skills/` **always** remains excluded in `.git/info/exclude`).
   - Choose **`n`** to hide all DrCortex files locally using `.git/info/exclude` (zero changes to `.gitignore`).

> **Tip:** You can also run `dcx init` non-interactively with flags:
> ```bash
> dcx init --stack custom --custom-stack "Go + React + PostgreSQL" --git track
> ```

---

### Step 4: Build Features Using the 5-Gate Workflow

Open your AI coding chat in the initialized project and simply describe what you want to build (tagging `@Envoy` is optional — your chat defaults to `@Envoy` automatically):

```text
Let's plan our first feature: [describe what you want to build or fix]
```

DrCortex will strictly guide every task through **5 sequential gates**:

1. **Gate 1 — Deep Discovery & Best Practice (`HARD STOP`):**
   `@Researcher` asks clarifying questions via `@Envoy` until **zero ambiguity remains**. Then `@Lead` and `@Architect` design the solution and `@Gatekeeper` holds execution until you approve.
2. **Gate 2 — Step Documentation (`HARD STOP`):**
   Once you approve Gate 1, DrCortex creates `agent/01-step-<slug>/instructions.md` and `tasks.md`. `@Envoy` summarizes the plan and `@Gatekeeper` waits for your explicit approval before any code is written.
3. **Gate 3 — Parallel Execution & Auto-QA:**
   `@Reviewer` writes failing tests first where applicable; `@Backend`, `@Frontend`, and any custom agents implement in parallel, checking off `- [x]` in `tasks.md` immediately per subtask; `@Reviewer` audits the diff and `@Ops` runs builds/tests.
4. **Gate 4 — Gatekeeper Verification & Manual UAT:**
   `@Gatekeeper` verifies all checklist items and tests passed, then `@Envoy` lists modified files and hands off to you for manual testing.
5. **Gate 5 — Feedback Loop or Closure:**
   - Need changes? Tell `@Envoy`, and the workflow updates the active step and loops back to Gate 3.
   - Everything works? Confirm completion — `@Gatekeeper` verifies sign-off, `@Ops` generates `reports/01-<slug>.md`, and `@Envoy` marks the step `DONE` in `agent/.internal/BOARD.md`.

---

### Step 5: Manage Skills, Custom Agents, Git & Status

At any point, you can add skills, create custom agents, or toggle Git visibility:

```bash
dcx skill list                  # List installed skills in agent/skills/
dcx skill find rust             # Search Skill Finder catalog
dcx skill add docker-devops     # Add a skill to agent/skills/ (always git-excluded)
dcx agent list                  # List 9 built-in + custom agents with ENABLED/DISABLED status
dcx agent add                   # Interactively add a custom agent in agent/agents/
dcx agent disable Gatekeeper    # Disable an agent in agent/.internal/BOARD.md
dcx agent enable Gatekeeper     # Re-enable a disabled agent
dcx status                      # Check platform, model tiers, skills, and agents
dcx git ignore                  # Hide AGENT.md, agent/, and reports/ locally
dcx git track                   # Track AGENT.md, agent/, and reports/ (agent/skills/ stays excluded)
```

---

## 🛠️ CLI Reference

| Command | Flags / Arguments | Description |
| :--- | :--- | :--- |
| `dcx setup` | — | Run the interactive global IDE & 4-tier model configuration wizard |
| `dcx init` | `--stack {python-nextjs,python-only,generic,custom}`<br>`--custom-stack "..."`<br>`--git {track,ignore}`<br>`--mode {migrate,coexist,overwrite}` | Initialize DrCortex, provision stack skills, and configure Git tracking |
| `dcx skill` | `list` \| `find <query>` \| `add <name>` | Discover and manage skills in `agent/skills/` (always git-excluded) |
| `dcx agent` | `list` \| `add [--name --tier --role --triggers]` \| `enable <name>` \| `disable <name>` | List, add, enable, or disable built-in & custom agents |
| `dcx git` | `track` \| `ignore` | Toggle Git tracking for `AGENT.md`, `agent/`, and `reports/` via `.git/info/exclude` |
| `dcx status` | — | Display global model hierarchy and local project status |

*(Both `drcortex` and `dcx` point to the same CLI executable.)*

---

## 📁 Project Workspace Structure

After running `dcx init`, your project root stays clean with only three DrCortex entries:

```text
your-project/
├── AGENT.md                          # Workspace entry rules for AI agents
├── agent/
│   ├── development-policy.md         # Stack-specific architecture, security & test commands
│   ├── .internal/
│   │   ├── BOARD.md                  # Active step, gate state, quota status & step history
│   │   └── step-template/
│   │       ├── instructions.md       # Step specification template
│   │       └── tasks.md              # Execution checklist template
│   └── 01-step-<slug>/               # Created per feature/bugfix during Gate 2
└── reports/
    ├── 00-report-template.md
    └── 01-<slug>.md                  # Generated by @Ops upon Gate 5 closure
```

---

## 🛡️ Engineering Guardrails & Circuit Breakers

- **Max 2-Strike Build Rule:** Agents get at most 2 build/test attempts per task. If the 2nd fails, execution halts immediately (`HALTED_ON_BUILD_ERROR`) and `@Envoy` reports the root cause and 2 proposed fixes.
- **Zero-Guessing Policy:** Ambiguous requirements trigger an immediate halt (`BLOCKED_ON_USER`) so `@Envoy` asks you instead of guessing.
- **Atomic Diff Limit:** Modifies at most 3–5 files per single turn (unless performing a global rename).
- **Strict Code Standards:** 3-layer separation (`Router -> Service -> Repository`), strict static typing (no `any`), N+1 query prevention, migration-only schema changes, zero hardcoded secrets, and server-side RBAC/IDOR checks.

---

## License

This project is open-source and available under the [MIT License](https://opensource.org/licenses/MIT).
