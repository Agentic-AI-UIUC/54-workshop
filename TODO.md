# TODO

Your checklist for the workshop, tonight, and Sunday. Check boxes as you go.

## Setup (first 5 minutes)

- [ ] Cursor installed and logged in
- [ ] Cursor CLI installed: `curl https://cursor.com/install -fsS | bash` (optional, Agent chat in the IDE works too)
- [ ] Cloned this repo: `git clone https://github.com/Agentic-AI-UIUC/54-workshop.git`
- [ ] Working inside the clone (copying `.cursor/` into your own repo is optional, later, after you've read `guard.sh`)
- [ ] `agent` runs in the terminal

You never hand-edit these files. You prompt the agent and it fills them in. The hook is how you check it obeyed.

## Round 1: Damage (8 minutes)

- [ ] Asked the agent to **force push to main**. It was denied.
- [ ] Prompted: **"Add `<your command>` to BLOCK_CMDS in .cursor/hooks/guard.sh and a matching check deny line in test.sh, then run test.sh."**
- [ ] It reports 9 passed, 0 failed

## Round 2: Drift (10 minutes)

- [ ] Filled the three blanks, twenty words max:

  ```text
  User types    ________
  Product does  ________
  Screen shows  ________
  ```

- [ ] Typed **`/setup`** in the agent. Answered its questions with that sentence. It writes `product.mdc`, renames and fills the skill, extends the hook, runs the tests.
- [ ] Read what it wrote. `product.mdc` under 20 lines? Skill folder name matches `name:`?
- [ ] Asked the agent to **build the flow in product.mdc**
- [ ] Ran it. Screenshot the moment it works.

## Round 3: Break it (4 minutes)

- [ ] Tried to talk the agent into running `rm -rf`. Any phrasing.
- [ ] If you got past the hook: added that pattern to `BLOCK_CMDS`, added a test, reran `test.sh`

## Round 4: Prove it (5 minutes)

- [ ] Prompted: **"Fill one row of the table in PITCH.md: task `<X>`, without `<Y>`, with `<Z>`. Add the how-we-measured line."** (or `/setup` already did it)
- [ ] Read the row. Numbers are yours, not the agent's guess.

## Tonight

- [ ] Two more forbidden commands in `guard.sh`, tests green
- [ ] The flow builds and runs end to end
- [ ] One number measured: seconds, clicks, or tokens
- [ ] `product.mdc` still under 20 lines

## Sunday

- [ ] **1:00 PM** Record a 90-second screen video of the flow working. Keep it on the laptop.
- [ ] The table from `PITCH.md` is slide 3 of your pitch
- [ ] **3:00 PM** Pitch. If the live demo dies, play the video and keep talking. Do not debug on stage.

## Stuck?

| Symptom | Fix |
|---|---|
| Hook doesn't fire | Restart Cursor. It caches `hooks.json`. |
| Agent ignores the rule | `alwaysApply: true` present? File ends in `.mdc`, not `.md`? |
| `python3: command not found` | Windows: use WSL or Git Bash. macOS: `xcode-select --install`. |
| Skill doesn't show up | Folder name and `name:` in `SKILL.md` must match exactly. |
| Anything else | Find us during the Sunday 1 to 3 PM work session. |
