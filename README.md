# Demos That Survive the Pitch

Cursor template for hackathon teams building a product this weekend. Any stack, any idea. Everything in here is a file the Cursor agent reads: a rule, a skill, and a hook. No install, no API keys, no framework.

Built for the Agentic AI workshop at Founders 54 Fall 2026 (UIUC). Works for any hackathon.

## Why this exists

Hackathon demos die in two ways. Cursor builds a generic app instead of your product, or it does something dumb the night before: force-pushes, deletes a folder, reads your `.env` into context. Both are fixable in under an hour with three small files. This repo is those three files plus a pitch checklist.

## Prerequisites

No plugins, no skills, no API keys. Just:

- Cursor, logged in (use the hackathon Pro code)
- Cursor CLI, optional: `curl https://cursor.com/install -fsS | bash`. Agent chat in the IDE works the same.
- git
- python3 and bash for the hook script. Present on macOS (Xcode Command Line Tools) and Linux. Windows: use WSL or Git Bash.

## Already have a project?

Copy the folder in. That is the whole integration.

```bash
git clone https://github.com/Agentic-AI-UIUC/54-workshop.git
cp -r 54-workshop/.cursor your-project/
cd your-project && agent
```

Existing `.cursor/rules/` merge with the copy. Then follow "Make it yours" below.

## Quick start

```bash
git clone https://github.com/Agentic-AI-UIUC/54-workshop.git my-demo
cd my-demo
agent          # Cursor CLI. Or open the folder in Cursor and use Agent chat.
```

Try these prompts:

| Prompt | What happens |
|--------|-------------|
| `force push this to main` | Blocked by the hook. Agent gets told why. |
| `read .env` | Blocked. Agent is pointed at `.env.example`. |
| `what are we building?` | Answers from `.cursor/rules/product.mdc`. |

Check the hook on your machine without Cursor:

```bash
bash .cursor/hooks/test.sh
```

Expected: `8 passed, 0 failed`.

## Make it yours

Fifteen minutes. Do them in order.

### 1. Rule: `.cursor/rules/product.mdc`

Your spec. `alwaysApply: true`, so the agent sees it on every prompt. Fill in:

- The one-flow sentence: *User types X, agent does Y, screen shows Z.*
- Your stack.
- Constraints the agent must obey (no auth, no DB, ask before adding deps).

Keep it under 20 lines. Longer rules get skimmed.

### 2. Skill: `.cursor/skills/your-product/SKILL.md`

How to run and demo your product. Loaded when the agent decides it's relevant, or when you type `/your-product`.

- Rename the folder to your product name. Lowercase, hyphens. The `name:` field must match the folder.
- Fill in: what it does, exact run commands, what "working" looks like.

### 3. Hook: `.cursor/hooks/guard.sh`

The hard gate. Runs before every shell command and every file read. Returns `allow` or `deny`. The agent cannot argue with it.

- Add your own patterns to `BLOCK_CMDS`. Regex, case-insensitive, matched against the full command string.
- Run `bash .cursor/hooks/test.sh` again. Add a `check` line for each pattern you added.

Defaults blocked: `git push --force`, `git push -f`, `rm -rf`, `git reset --hard`, `git clean`, `drop table`, and any read of `.env*`, `secrets.*`, `*.pem`, `id_rsa`. `.env.example` is allowed.

### 4. Build

Ask the agent: `build the flow in product.mdc`. It scaffolds the one thing your demo shows and nothing else.

### 5. Checklist: `TODO.md`

Every step for the workshop, tonight, and Sunday, with checkboxes and a stuck table. `PITCH.md` holds the benchmark table for slide 3 of your pitch.

## How the pieces fit

| Piece | File | When it loads | Soft or hard |
|-------|------|---------------|--------------|
| Rule | `.cursor/rules/*.mdc` | Every prompt (`alwaysApply`) or when relevant (`description`) | Soft. Agent can drift. |
| Skill | `.cursor/skills/<name>/SKILL.md` | When relevant, or `/name` | Soft. Agent chooses. |
| Hook | `.cursor/hooks.json` + script | Before the action, every time | Hard. Script decides. |

Rule says what to build. Skill says how to use it. Hook says what is never allowed. Put anything that would embarrass you on stage in the hook, not the rule.

## Hook details

`.cursor/hooks.json` registers `guard.sh` for two events with `failClosed: true`, so a crashed hook blocks instead of allowing.

```json
{
  "version": 1,
  "hooks": {
    "beforeShellExecution": [{ "command": ".cursor/hooks/guard.sh", "failClosed": true }],
    "beforeReadFile":       [{ "command": ".cursor/hooks/guard.sh", "failClosed": true }]
  }
}
```

Cursor sends JSON on stdin. For shell: `{"command": "...", "cwd": "..."}`. For reads: `{"file_path": "...", "content": "..."}`. The script reads whichever field is present, greps it against the block lists, and prints one of:

```json
{"permission":"allow"}
{"permission":"deny","user_message":"...","agent_message":"..."}
```

Only the command text and the file path are inspected. File content is never grepped, so a source file containing the string `rm -rf` still opens.

Dependencies: bash, grep, python3 (for JSON parsing; ships with Xcode Command Line Tools on macOS). No jq.

## Files

```
.cursor/
├── hooks.json                     hook registration
├── hooks/guard.sh                 the gate
├── hooks/test.sh                  8 assertions, runs without Cursor
├── rules/product.mdc              your spec, always in context
└── skills/your-product/SKILL.md   how to run and demo your product
TODO.md                            step-by-step checklist, workshop through Sunday
PITCH.md                           the pitch table and how-you-measured line
.env.example                       agent may read this; .env it may not
```

## Also works in Claude Code

Same ideas, different paths: `CLAUDE.md` for the rule, `.claude/skills/<name>/SKILL.md` for the skill, `PreToolUse` hooks in `.claude/settings.json` for the gate. The hook script is the same shape; only the input JSON field names differ (`tool_input.command`, `tool_input.file_path`) and the output is `{"decision":"block","reason":"..."}`. Port `guard.sh` in ten minutes if you need it.

## Workshop slides

`slides/` is a [presenterm](https://github.com/mfontanini/presenterm) deck on the Agentic AI @ UIUC theme.

```bash
slides/present.sh     # present; Ctrl-E runs the hook self-check live on the demo slide
slides/check.sh       # overflow check at 90x26 and 72x20 before you go on stage
slides/pdf.sh         # slides/slides.pdf, one page per slide, footer site name is a clickable link
```

Turn the terminal font up until it is about 72 to 80 columns wide. The deck is validated to fit there.

## Reference

- Cursor rules: https://cursor.com/docs/rules
- Cursor skills: https://cursor.com/docs/skills
- Cursor hooks: https://cursor.com/docs/hooks
- Spotify's production version of the same pattern, hooks that gate large file reads and route them to a cheaper model: https://github.com/spotify/portal-ai-plugins (see `plugins/shunt`)

## License

MIT
