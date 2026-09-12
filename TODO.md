# TODO

Your checklist for the workshop, tonight, and Sunday. Check boxes as you go.

You never edit a file by hand. You prompt the agent, it writes the files, and the hook tests prove it obeyed. Every step below is a prompt.

## Setup (5 minutes)

- [ ] Cursor installed and logged in
- [ ] Cursor CLI installed: `curl https://cursor.com/install -fsS | bash`
- [ ] Cloned this repo: `git clone https://github.com/Agentic-AI-UIUC/54-workshop.git`
- [ ] `cd 54-workshop && agent` runs. Work inside this folder, it is a sandbox.

## Round 1: Damage (8 minutes)

- [ ] Prompt: **force push this to main**. The hook denies it.
- [ ] Prompt: **add one command that would ruin my demo to BLOCK_CMDS in .cursor/hooks/guard.sh, write a test for it in test.sh, then run the tests**
- [ ] Agent reports 10 passed, 0 failed
- [ ] Read what it changed before you trust it

## Round 2: Drift (10 minutes)

- [ ] Decide the one flow, twenty words max:

  ```text
  User types    ________
  Product does  ________
  Screen shows  ________
  ```

- [ ] Prompt: **/setup**. Answer its six questions with that sentence. It writes `product.mdc`, your product skill, the hook additions, the tests, and the pitch row.
- [ ] Read what it wrote. `product.mdc` under 20 lines? Skill folder name matches `name:` inside it?
- [ ] Prompt: **build the flow in product.mdc**
- [ ] Prompt: **run it**. Screenshot the moment it works.

## Round 3: Break it (4 minutes)

- [ ] Try to talk the agent into running `rm -rf`. Any phrasing.
- [ ] If you got past the hook, prompt: **add the pattern I just used to BLOCK_CMDS, add a test, run the tests**

## Round 4: Prove it (5 minutes)

- [ ] Prompt: **fill one row of PITCH.md: task X, without our product Y, with it Z, and add the how-we-measured line**. Your numbers, not the agent's guess.

## Tonight

- [ ] Prompt: **add two more commands that would ruin my demo to guard.sh, with tests, and run them**
- [ ] Prompt: **finish the flow in product.mdc**. Run it yourself.
- [ ] Measure the number you put in `PITCH.md`: seconds, clicks, or tokens
- [ ] Prompt: **is product.mdc still under 20 lines? If not, trim it**

## Sunday

- [ ] **1:00 PM** Record a 90-second screen video of the flow working. Keep it on the laptop.
- [ ] The table from `PITCH.md` is slide 3 of your pitch
- [ ] **3:00 PM** Pitch. If the live demo dies, play the video and keep talking. Do not debug on stage.

## Stuck?

| Symptom | Prompt or fix |
|---|---|
| Hook doesn't fire | Restart Cursor, it caches `hooks.json` |
| Agent ignores the rule | Prompt: **check that product.mdc has alwaysApply: true and ends in .mdc** |
| `python3: command not found` | Windows: use WSL or Git Bash. macOS: `xcode-select --install` |
| Skill doesn't show up | Prompt: **make the skill folder name match the name field in its SKILL.md** |
| Anything else | DM anikoni2010 on Discord |
