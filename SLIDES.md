---
title: Demos That Survive the Pitch
sub_title: Guardrails for Cursor. Founders 54, Fall 2026
author: Agentic AI @ UIUC
---

Why demos die
===

<!-- jump_to_middle -->

Two ways, every hackathon.

<!-- pause -->

1. Cursor builds a **generic app**, not your product.

<!-- pause -->

2. Cursor does something **dumb the night before**.
   Force push. `rm -rf`. Reads your `.env` into context.

<!-- pause -->

Both fixable in under an hour. Three files.

<!-- speaker_note: Ask for hands. Who has had Cursor add auth you did not ask for? Who has lost work to a bad git command? Then: Spotify open sourced this exact pattern last month, we will see it in slide 6. -->

<!-- end_slide -->

Scope to one flow
===

Judges see three minutes. Pick one.

```
User types  ______
Cursor/app does  ______
Screen shows  ______
```

<!-- pause -->

Everything else is a slide, not a demo.

<!-- pause -->

**Tonight:** write that sentence. Twenty words max.

<!-- speaker_note: This is the non-technical half of the room's task. Founders write it, builders build it. Give one example from a real 54 team if you have one. -->

<!-- end_slide -->

Three files
===

<!-- column_layout: [1, 1, 1] -->

<!-- column: 0 -->

## Rule

`.cursor/rules/`

Your spec.
Always in context.

**Soft.**
Cursor can drift.

<!-- column: 1 -->

## Skill

`.cursor/skills/`

How to run
your demo.

**Soft.**
Cursor chooses.

<!-- column: 2 -->

## Hook

`.cursor/hooks/`

What is never
allowed.

**Hard.**
Script decides.

<!-- reset_layout -->

<!-- pause -->

Rule says what to build. Skill says how to use it. Hook says never.

<!-- speaker_note: Land the soft vs hard distinction here. A rule is a suggestion the model usually follows. A hook is bash that runs before the action and returns allow or deny. The model cannot talk its way past it. -->

<!-- end_slide -->

Rule: make Cursor build your product
===

```markdown
---
description: What we are building and how
alwaysApply: true
---

User types X, agent does Y, screen shows Z.

Stack: Next.js + TypeScript

- Build only the flow above.
- Smallest working version. No auth, no DB.
- Every step visible on screen.
- Never touch .env. Read .env.example.
- Ask before adding a dependency.
```

<!-- pause -->

Under twenty lines. Longer gets skimmed.

<!-- speaker_note: LIVE: switch to terminal. cd into the repo, run agent, ask "what are we building?" It quotes product.mdc. Then ask it to add login. It should refuse or push back. That is the rule working. -->

<!-- end_slide -->

Hook: the hard gate
===

```json
{
  "version": 1,
  "hooks": {
    "beforeShellExecution": [
      { "command": ".cursor/hooks/guard.sh",
        "failClosed": true }
    ],
    "beforeReadFile": [
      { "command": ".cursor/hooks/guard.sh",
        "failClosed": true }
    ]
  }
}
```

<!-- pause -->

Cursor sends JSON in. Script prints `allow` or `deny`. That's it.

<!-- speaker_note: LIVE: ask agent to run rm -rf on a fake path. Show the deny message. Then open guard.sh, point at BLOCK_CMDS. Forty lines of bash. Then run the self check on the next slide. -->

<!-- end_slide -->

Prove the gate works
===

No Cursor needed. Eight assertions, plain bash.

```bash +exec
bash .cursor/hooks/test.sh
```

<!-- pause -->

Spotify ships the same pattern in production:
hooks that block reads over 350 lines and route
them to a cheaper model. 82 to 94 percent fewer tokens.

`github.com/spotify/portal-ai-plugins`, see `plugins/shunt`

<!-- speaker_note: Press ctrl+e to run the block live (needs presenterm -x). Green output on screen. Then one sentence on Spotify: this is not a workshop toy, a platform team at Spotify open sourced this exact shape on Aug 11 with a benchmark table. -->

<!-- end_slide -->

Hands-on
===

<!-- jump_to_middle -->

```bash
git clone https://github.com/Agentic-AI-UIUC/54-workshop.git
cd 54-workshop
agent
```

1. Ask: **force push to main**. Watch it deny.
2. Edit `.cursor/rules/product.mdc`. Your flow, your stack.
3. Rename `.cursor/skills/your-product/`. Fill in `SKILL.md`.
4. Ask: **build the flow in product.mdc**.

Twelve minutes. I'm walking around.

<!-- speaker_note: Put this slide up and leave it. Circulate. Common failures: python3 missing on Windows, use WSL. Hook not firing, restart Cursor, it caches hooks.json. Agent ignoring rule, check alwaysApply is true. -->

<!-- end_slide -->

Prove it, protect it
===

One honest number beats ten adjectives.

| Task | Without | With | Delta |
|------|---------|------|-------|
| Book a truck load | 14 min | 40 s | 95% |

<!-- pause -->

Sunday 1 PM: record a 90 second video of the flow working.

<!-- pause -->

Demo dies on stage? Play the video. Keep talking.
Never debug in front of judges.

<!-- speaker_note: This hands off to tomorrow's 12:20 pitching workshop. Table goes on slide 3 of their pitch. Judges will ask how you measured it, so PITCH.md has a line for that. -->

<!-- end_slide -->

Tonight
===

<!-- jump_to_middle -->

- [ ] One-flow sentence in `product.mdc`
- [ ] `SKILL.md` filled in
- [ ] Your three forbidden commands in `guard.sh`
- [ ] Cursor builds the flow
- [ ] One number measured

**Sunday:** video at 1 PM, table on slide 3, pitch at 3 PM.

`github.com/Agentic-AI-UIUC/54-workshop`

<!-- speaker_note: Leave this up for Q&A. Point at PITCH.md in the repo, same checklist. Mentor hours are 3 to 4 tomorrow if a hook will not fire. -->
