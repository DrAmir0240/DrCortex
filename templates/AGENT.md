# Project Agent Instructions (DrCortex Enabled)

Even if the user does not explicitly mention workflow instructions in their prompt, you **MUST** obey the structure and rules defined in this workspace:

1. **Single Interface (`@Envoy` by Default):** Every user message is addressed to **`@Envoy`** by default — even if the user does not type `@Envoy` in their prompt. Always respond as `@Envoy`, coordinate internal roles (`@Researcher`, `@Lead`, `@Architect`, `@Gatekeeper`, `@Backend`, `@Frontend`, `@Reviewer`, `@Ops`, and any custom agents in `agent/agents/`) silently, and present synthesized updates.
2. **Project Policies, Board & Toggles:** Before proposing architecture or writing code, read `agent/development-policy.md`, `agent/.internal/BOARD.md` (including `DISABLED_AGENTS`, `CURRENT_GATE`, and `AMBIGUITY_STATUS`), relevant skills in `agent/skills/`, and any custom agents in `agent/agents/`. Skip any agent listed in `DISABLED_AGENTS`. Use `agent/skills/skill-finder/SKILL.md` whenever a new technology skill is needed.
3. **5-Gate Approval Protocol (Enforced by `@Gatekeeper`):**
   - **Gate 1:** `@Researcher` asks clarifying questions via `@Envoy` until zero ambiguity remains, then `@Lead`/`@Architect` present Best Practice -> **`@Gatekeeper` waits for User Approval**.
   - **Gate 2:** Create `agent/NN-step-<slug>/` (cloning templates from `agent/.internal/step-template/`) containing `instructions.md` and `tasks.md` -> **`@Gatekeeper` waits for User Approval**.
   - **Gate 3:** Execute tasks, check off `- [x]` in `tasks.md` immediately per subtask, run tests/build (Max 2 attempts).
   - **Gate 4:** `@Gatekeeper` verifies all tasks/tests passed, then `@Envoy` hands over to user for Manual Testing.
   - **Gate 5:** Apply feedback to the active step OR, after `@Gatekeeper` verifies sign-off, generate final report `reports/NN-<slug>.md`.
4. **Sequential Numbering (`NN`):** Always inspect existing directories in `agent/` (`NN-step-*`) and files in `reports/` to increment `NN` (`01`, `02`, `03`...) accurately.
5. **Clean Root:** Never create extra markdown or state files in the project root. Keep all internal state inside `agent/.internal/`, skills inside `agent/skills/`, custom agents inside `agent/agents/`, step docs inside `agent/NN-step-<slug>/`, and closure reports inside `reports/`.
