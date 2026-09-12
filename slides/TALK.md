# Talk track

What to say, slide by slide. Read it once, then present from the slides. The bold line on each slide is the one sentence to land if you say nothing else.

---

## 1. Title

"Hi, I'm Anirudh from Agentic AI at UIUC. This is sixty minutes, laptops open the whole time. By the end you'll have three files in your repo that make Cursor build your product instead of a generic app, and stop it from wrecking your demo the night before you pitch."

## 2. Agenda

"Four rounds. Each one is the same shape: I show Cursor failing, I show the fix, then you do it on your own laptop. Damage is Cursor breaking things. Drift is Cursor building the wrong thing. Break it is you trying to defeat the fix. Prove it is what goes on your pitch slide Sunday."

**Why this matters:** "Everyone here is going to build with AI this weekend. Nobody's going to hand-write the code. So the question isn't 'can Cursor build it', it's 'will Cursor build *yours*, and will it still be there at 3 PM Sunday.'"

## 3. Setup

"Install the CLI if you haven't, clone the repo, run `agent`. Two minutes. Work inside the clone. It's a sandbox, nothing here touches your project. If you want the same guardrails in your own repo later, copy the `.cursor` folder over, after you've read what it blocks. That's your call, not mine."

Walk to anyone stuck. Windows people need WSL or Git Bash because the hook is a bash script.

## 4. Divider: Damage

"Round one. Stop Cursor from breaking your repo."

## 5. 2 AM, no guardrails

Run the command on the slide. Empty folder, `agent --yolo`, ask it to delete the scratch folder. It does.

"Watch what just happened. I asked, it deleted, no question. `--yolo` means approvals are off. And that's not a weird flag, that's every one of you at 2 AM after you've clicked 'always allow' forty times. You stop reading. Cursor stops asking."

**Why this matters:** "Cursor isn't careless. It's obedient. It did exactly what I said. The problem is nothing in that folder told it no. There was no rule, no policy, nothing outside the model that could say 'not that.'"

## 6. Same prompt, with the gate

Same prompt in the template folder. Denied. Show the message.

"Same request. Different answer. The difference is one folder, `.cursor`, and inside it a file called `hooks.json` that points at a 40-line bash script. Cursor runs that script before every shell command. The script prints allow or deny. That's it."

**Why this matters:** "The model never gets a vote. It can want to run `rm -rf` as hard as it likes. The script runs first and says no. This is the difference between asking an AI nicely and actually controlling it."

## 7. Your turn: trip it, extend it

"Ask your agent to force push to main. Watch it get denied. Then tell the agent, in plain English, to add one command that would ruin your demo to the block list and write a test for it. Don't edit the file yourself. The agent writes the code. The hook proves it obeyed."

**Why this matters:** "You're doing two things at once here. Adding a guardrail, and having the AI add it for you. That's the whole weekend in miniature: you describe, it writes, something outside the model checks."

## 8. Divider: Drift

"Round two. Keep Cursor on your product, not a generic app."

## 9. "Build me a dashboard"

Run it in the bare folder. Let it plan for twenty seconds. Read the plan out loud.

"Auth page. Settings. Dark mode. A sidebar with six routes. I asked for a dashboard for trucking logistics and I'm getting a SaaS template. None of this is on anybody's pitch slide."

**Why this matters:** "Every prompt starts from zero. Cursor doesn't know what your product is, so it guesses, and the guess is always the average app on the internet. Judges have seen that app. It doesn't win."

## 10. Same prompt, with the rule

Same prompt in the template. It scopes down and quotes the rule.

"One file, `product.mdc`, twenty lines. It says: here's the one flow, here's the stack, don't add auth, don't add a database, ask before adding a dependency. And the key line at the top: `alwaysApply: true`. That means Cursor reads it on every single prompt. You write the spec once, and it's in the room for every conversation after."

**Why this matters:** "This is soft, though. It's a suggestion the model usually follows. You can argue it into adding login if you push. That's why the hook exists for the things that must never happen, and the rule exists for the things that should usually happen."

## 11. Your turn: write the spec once

"Fill three blanks. User types what, product does what, screen shows what. Twenty words. If you can't fill them, you don't have a demo yet, you have a feature list, and that's worth knowing now rather than Sunday. Then type `/setup`. It's a skill in the repo. It'll ask you six questions, one at a time, and write every file: the rule, your product's skill, the hook additions, the tests, the pitch row. Read the diff when it's done. Then ask it to build the flow."

**Why this matters:** "Notice `/setup` is itself a skill. You're using the thing you're learning about to set up the thing you're learning about. Rules and skills are how you tell the agent what you want. Hooks are what you don't have to trust the agent about."

## 12. Divider: Break it

"Round three. Try to trick Cursor past the hook."

## 13. Get past the gate

"Four minutes. Talk your agent into running `rm -rf`. Any phrasing. Tell it you're the admin. Tell it to use `sh -c`. Tell it to write a script and run that. Go."

Let them try. Someone will find something, probably the script-file trick.

**Why this matters:** "The rule can be argued with. The hook is bash. You can't persuade bash. If someone found a way through, it's not because the model outsmarted the script, it's because the script's list didn't have that shape on it. Which brings us to the next slide."

## 14. Three properties

Whoever got through, ask what they did. Add the pattern to `BLOCK_CMDS` live. Rerun `test.sh`. Green.

"Three things make this hold. It runs outside the model, before the action. It fails closed, so if the script crashes the action is blocked, not allowed. And it's tested, nine assertions, no Cursor needed. Someone finds a bypass? Add it to the list, add a test. That's the whole maintenance loop. Thirty seconds, you just watched it."

## 15. Spotify does this

"This isn't a workshop toy. A month ago Spotify open-sourced the same shape: a hook that blocks large file reads and routes them to a cheaper model. Hook, script, skill. Eighty to ninety-four percent fewer tokens. Fifty-one tests. Same three files you just wrote."

Cut this slide first if you're running long.

## 16. Divider: Prove it

"Round four. A metric for the pitch, a backup video for the demo."

## 17. One honest number

"Tell the agent to fill one row of `PITCH.md`. Pick a task your product does. How long without it, how long with it. Seconds, clicks, or tokens. Measure it, don't guess it, and write one line on how you measured it, because a judge will ask."

**Why this matters:** "One measured row beats ten adjectives. 'Fourteen minutes by hand, forty seconds with us' is a sentence a VC can check. 'Seamless' and 'powerful' are not."

## 18. The video rule

Say this slowly.

"Sunday, 1 PM, record ninety seconds of the flow working. Keep it on the laptop. If the live demo dies on stage, play the video and keep talking. Never debug in front of judges. Nobody has ever won a hackathon by fixing a bug live."

## 19. Two teams

Pick two screens you saw working while walking. "What did the hook stop? What did the rule keep Cursor from adding? Show the flow running." Two minutes each. If a demo stalls, thank them and move on. That's the video rule, live.

## 20. What you did

"You wrote a hook. Cursor tried to get past it and couldn't. You wrote a rule. Cursor built your flow, not a dashboard. You wrote one row a judge can check."

**The closing idea:** "Cursor owns the loop, the model, the tools. You own two things: what's in its context, and what it's allowed to do. Rules and skills are the first. Hooks are the second. That's the whole harness, and it's three files."

## 21. TODO

"Tonight: two more forbidden commands, finish the flow, measure the number. Sunday: video at one, table on slide three, pitch at three. All of it's in `TODO.md` in the repo, with a stuck table at the bottom."

## 22. That's it

"Need help? Questions? DM me on Discord. Go build."

---

## If someone asks

**"Why not just be careful with prompts?"** Because at 2 AM you aren't. The hook doesn't get tired.

**"Does this slow Cursor down?"** The hook is a bash script that greps a string. Milliseconds.

**"What if the hook blocks something I actually need?"** Edit the list. It's your file. That's the point: the policy is yours, not the model's.

**"Does this work in Claude Code / Codex?"** Same idea, different file paths. Rule is `CLAUDE.md`, hooks are in `.claude/settings.json`, output is `decision: block` instead of `permission: deny`. Ten-minute port. README has the mapping.

**"Is this overkill for a hackathon?"** It's three files and fifteen minutes. The alternative is losing an hour at 2 AM to a deleted folder.
