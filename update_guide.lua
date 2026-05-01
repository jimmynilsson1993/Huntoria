--[[
Canary Update Guide
For: C:\Canary\canary-src
Audience: Beginner

Purpose:
This file is a plain-language checklist you can open whenever you want
to update your server safely without crashing the live server.

Important idea:
Do not update directly in panic or stress.
Always work in a calm order:
1. Backup
2. Save your current work
3. Check what Canary changed
4. Update
5. Build
6. Test
7. Open for players

======================================================================
PART 1 - WHAT YOU SHOULD UNDERSTAND FIRST
======================================================================

1. "git status"
Shows what you changed on your server.

2. "git commit"
Saves your current state as a restore point inside Git.

3. "git fetch"
Checks for new updates from Canary without changing your files yet.

4. "git pull"
Downloads and merges Canary updates into your server files.

5. "build"
Creates a new canary.exe from the updated source code.

6. "test"
Means you start the server, read the log, and confirm important things work.

======================================================================
PART 2 - GOLDEN RULES FOR A LIVE SERVER
======================================================================

Rule 1:
Never update without a backup.

Rule 2:
Never update while many players are online.

Rule 3:
Never run git pull before saving your own work in a commit.

Rule 4:
Never assume the update is safe until the server has started cleanly.

Rule 5:
Always read the first startup log after an update.

======================================================================
PART 3 - YOUR SAFE LIVE UPDATE ROUTINE
======================================================================

Follow these steps in this exact order.

STEP 1 - PICK A GOOD TIME
Choose a quiet time with few or no players online.

STEP 2 - WARN PLAYERS
Tell players the server will restart for an update.
Give them time to log out safely.

STEP 3 - STOP THE SERVER CLEANLY
Do a normal shutdown.
Do not force-close it unless it is frozen.

STEP 4 - TAKE BACKUPS
At minimum, back up:
- the database
- config.lua
- data
- data-otservbr-global
- website files if they changed

If possible, create a dated backup folder like:
C:\Canary\backups\2026-05-01-before-update

STEP 5 - OPEN POWERSHELL IN:
C:\Canary\canary-src

STEP 6 - CHECK YOUR CURRENT CHANGES
Command:
git status --short --branch

What you want to see:
- If files are changed, that is okay.
- You just need to save them before updating.

STEP 7 - SAVE YOUR CURRENT WORK
Commands:
git add .
git commit -m "Backup commit before Canary update"

Why:
This gives you a known safe restore point.

STEP 8 - CHECK IF CANARY HAS NEW UPDATES
Commands:
git fetch origin
git log --oneline HEAD..origin/main

How to read it:
- If you see lines, Canary has new updates.
- If you see nothing, you are already up to date.

STEP 9 - IF THERE ARE NO NEW UPDATES
Stop here.
You do not need to do anything else.

STEP 10 - IF THERE ARE NEW UPDATES
Command:
git pull origin main

Possible result A:
It succeeds directly.

Possible result B:
Git says there is a conflict.

If there is a conflict:
- Do not panic.
- It only means both you and Canary changed the same file.
- Open the file, decide what should stay, then save it.
- After fixing the conflict:
  git add .
  git commit -m "Resolve merge after Canary update"

STEP 11 - BUILD THE NEW SERVER
After pull succeeds, build a new canary.exe using your normal build method.

Important:
Do not skip the build step if source code changed.

STEP 12 - TEST BEFORE OPENING FOR PLAYERS
Start the server and check:
- no fatal startup errors
- database connects
- Monk still works
- events load correctly
- website still opens
- login works

STEP 13 - WATCH THE LOG CAREFULLY
Pay special attention to:
- missing XML files
- missing Lua files
- database errors
- config errors
- warnings that did not exist before

STEP 14 - ONLY THEN OPEN FOR PLAYERS
If startup is clean and important systems work, let players back in.

======================================================================
PART 4 - WHAT TO DO IF SOMETHING GOES WRONG
======================================================================

If the update breaks the server:

1. Stop the server.
2. Go back to your previous safe version.
3. Restore the previous exe and files if needed.
4. Restore database backup only if the database was affected.
5. Read the error calmly.
6. Fix the issue in test mode before reopening.

Important:
Because you made a commit before updating, you have a Git restore point.

======================================================================
PART 5 - SIMPLE COMMAND CHEAT SHEET
======================================================================

Check current changes:
git status --short --branch

Save current work:
git add .
git commit -m "Backup commit before Canary update"

Check for new Canary updates:
git fetch origin
git log --oneline HEAD..origin/main

Pull the update:
git pull origin main

See recent history:
git log --oneline -10

======================================================================
PART 6 - VERY IMPORTANT ADVICE FOR YOU
======================================================================

Best practice for the future:
Have 2 server copies if possible.

1. Live server
This is the one real players use.

2. Test server
This is where you try updates first.

That way, you can:
- pull updates safely
- build safely
- test safely
- only move to live when you know it works

This is the safest way to avoid crashing everything.

======================================================================
PART 7 - THE SHORT VERSION
======================================================================

When Canary updates, do this:

1. Stop live server at a quiet time
2. Take backup
3. git status
4. git add .
5. git commit -m "Backup commit before Canary update"
6. git fetch origin
7. git log --oneline HEAD..origin/main
8. git pull origin main
9. Build new canary.exe
10. Test start
11. Read log
12. Reopen for players

If you remember only one thing, remember this:
Backup first. Commit first. Test before opening.
]]

