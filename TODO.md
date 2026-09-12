# TODO

Your checklist for this workshop! Check boxes as you go

You never edit a file by hand. You prompt the agent, it writes the files, and the hook tests prove it obeyed. Every step below is a prompt

## Setup (5 minutes)

- [ ] Cursor installed and logged in
- [ ] Cursor CLI installed: `curl https://cursor.com/install -fsS | bash`
- [ ] Cloned this repo: `git clone https://github.com/Agentic-AI-UIUC/54-workshop.git`
- [ ] `cd 54-workshop && agent` runs. Work inside this folder, it is a sandbox.

## Part 1: Damage (8 minutes)

- [ ] Prompt: **force push this to main**. The hook denies it.
- [ ] Prompt: **add one command that would ruin my demo to BLOCK_CMDS in .cursor/hooks/guard.sh, write a test for it in test.sh, then run the tests**
- [ ] Agent reports 10 passed, 0 failed
- [ ] Read what it changed before you trust it

## Part 2: Drift (10 minutes)

- [ ] Prompt: **/setup**. It asks six questions, one at a time: what the user types, what the product does, what the screen shows, your stack, three commands to block, one thing to measure. Answer in plain English. It writes `product.mdc`, your product skill, the hook additions, the tests, and the pitch row.
- [ ] Can't answer the first three? You have a feature list, not a demo. Pick one flow and answer again.
- [ ] Read what it wrote. `product.mdc` under 20 lines? Skill folder name matches `name:` inside it?
- [ ] Prompt: **build the flow in product.mdc**
- [ ] Prompt: **run it**. Screenshot the moment it works.

## Part 3: Break it (4 minutes)

- [ ] Try to talk the agent into running `rm -rf`. Any phrasing.
- [ ] If you got past the hook, prompt: **add the pattern I just used to BLOCK_CMDS, add a test, run the tests**

## Part 4: Prove it (5 minutes)

- [ ] Prompt: **fill one row of the pitch table in TODO.md: task X, without our product Y, with it Z, and add the how-we-measured line**. Your numbers, not the agent's guess.

  Slide 3 of your pitch. One measured row beats ten adjectives.

  | Task | Without our product | With our product | Delta |
  |------|-------------------|----------------|-------|
  | e.g. Book a truck load | 14 min, 3 tools | 40 s, 1 prompt | 95% faster |
  | | | | |

  How you measured it: ___ (one line, judges will ask)

## Tonight

- [ ] Prompt: **add two more commands that would ruin my demo to guard.sh, with tests, and run them**
- [ ] Prompt: **finish the flow in product.mdc**. Run it yourself.
- [ ] Measure the number in the pitch table: seconds, clicks, or tokens
- [ ] Prompt: **is product.mdc still under 20 lines? If not, trim it**

## Sunday

- [ ] **1:00 PM** Record a 90-second screen video of the flow working. Keep it on the laptop.
- [ ] The pitch table above is slide 3 of your pitch
- [ ] **3:00 PM** Pitch. If the live demo dies, play the video and keep talking. Do not debug on stage.

## Stuck?

| Symptom | Prompt or fix |
|---|---|
| Hook doesn't fire | Restart Cursor, it caches `hooks.json` |
| Agent ignores the rule | Prompt: **check that product.mdc has alwaysApply: true and ends in .mdc** |
| `python3: command not found` | Windows: use WSL or Git Bash. macOS: `xcode-select --install` |
| Skill doesn't show up | Prompt: **make the skill folder name match the name field in its SKILL.md** |
| Anything else | DM anikoni2010 on Discord |
