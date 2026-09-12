---
name: setup
description: Interview the team and fill in the rule, skill, guard hook, and pitch row for their product. Use when the user says /setup, "set this up for my product", or asks to fill in product.mdc, SKILL.md, guard.sh, or PITCH.md.
---

# setup

Fill in this template for the user's product. Ask, then write. Do not guess.

## 1. Ask, one question at a time

1. What does the user type or click? (the input)
2. What does the product do with it? (the one action)
3. What appears on screen at the end? (the output)
4. Stack? (e.g. Next.js + TypeScript, Python + FastAPI, plain HTML)
5. Three commands that would wreck your demo if the agent ran them? Offer examples: `git checkout .`, `npm publish`, `docker system prune`, `curl` to a production URL.
6. One thing you could measure, before vs after? (seconds, clicks, or tokens)

Stop after each question and wait for the answer.

## 2. Write, in this order

- `.cursor/rules/product.mdc`: keep `alwaysApply: true`. One-flow sentence from answers 1 to 3. Stack from 4. Keep the existing constraint bullets. Under 20 lines total.
- `.cursor/skills/<product-name>/SKILL.md`: move `.cursor/skills/your-product/` to a lowercase-hyphen product name (`mv`, not copy, so `your-product/` no longer exists). `name:` must match the folder. Fill what it does, how to run it, what "working" looks like.
- `.cursor/hooks/guard.sh`: append the three commands from answer 5 to `BLOCK_CMDS` as case-insensitive regex patterns. Prefer plain text or `[.]` over backslash escapes.
- `.cursor/hooks/test.sh`: add one `check deny` line per new pattern.
- `PITCH.md`: fill one row of the table from answer 6 and the "how you measured it" line.

## 3. Verify

Run `bash .cursor/hooks/test.sh`. Report the pass count. If anything fails, fix the pattern, not the test.

## Do not

- Touch files outside `.cursor/` and `PITCH.md`.
- Add features, dependencies, auth, or a database. The rule forbids it and so does this skill.
- Remove any existing `BLOCK_CMDS` entry.
