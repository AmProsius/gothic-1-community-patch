## How are Fixes Implemented?

In most cases a fix requires to change the content of a particular Daedalus function. That could be adding or removing a condition that determines the return value of the function or under which another function is called (e.g. closing a quest, attacking the player, giving items to the player, ... ).

Ninja conveniently allows to overwrite functions. This would be an easy way, but we **definitely do not want to do this**. If we replace entire functions, we run the risk of removing anything a mod might have changed. That could be starting/closing a quest specific to that mod or giving the player a new item or other things, resulting in breaking the entire mod in the worst case. So, although convenient, we are *not* using this functionality of Ninja.

Instead, to safely inject our changes, without compromising any "third-party changes", we have two options:

### 1. Wrap around the function
This allows us to check/change things before or after the original function was called, i.e. `[new stuff] -> original function -> [new stuff]`. This is particularly useful if we want to *add* new things, like setting a variable or giving the player an item if it wasn't done by the original function.

- **Advantages**:
    - As long as we can reliably check if the action wasn't already added by a mod, this is quite reliable.

- **Disadvantages**:
    - We cannot easily *remove* things that the original function does. We may be able to revert things, but that does not always work well. (imagine a quest being opened with a screen print, and then we close the quest again, the player will be confused about the screen print).
    - The fix is done at "run-time". That means we cannot know before the original function is eventually called, whether the fix *(a)* will actually work and *(b)* was already made by a mod. Consequently, when creating the "wrap" around the function at the start of the game, it will say "APPLIED" in the zSpy, when in fact we cannot be sure.

### 2. Modifying the function
Here we search the compiled byte code of the original function and modify the function directly. This may sound scary. What it means is, that we make an assumption of how the original function will look like based on the original scripts. We search for the expected bytes - that may be a call to a function or a particular condition. If found, we will carefully (under a lot of safety conditions) rewrite individual bytes or inject new byte code to insert our changes.

- **Advantages**:
    - We know at start of Gothic, whether the fix worked or not and the zSpy output is actually helping.
    - We will only change exactly what we intend.

- **Disadvantages**:
    - If the mod changed the original function sufficiently enough, we will not find the expected bytes and the fix will not be applied. This should be okay, however. If a mod changed a function to such an extend, we can assume that the mod may have already addressed the issue. If not, better safe than sorry: We prioritize stability/compatibility (not destroying a mod) over applying the fixes.

## What is the Difference Between a Session Fix and a Game Save/Revertible Fix?

The scenarios described above only hold for *"session fixes"*. There, we change the behavior of functions. These are always the same, irrespective of the game save. In other words, Gothic loads these functions into memory and does not change/reload them for the entire time while Gothic is running. That time is what we refer to as a *session*: From starting the Gothic exe to quitting the game. Since functions do not change, we only have to apply our fixes once at the start of launching the Gothic exe and they remain for the rest of the session. Once closing Gothic they are gone. We apply our session fixes just before reaching the main menu the first time. All session fixes are then listed in the zSpy (if open) with `APPLIED` or `NOT APPLIED`. This may come in handy for debugging in conjunction with other G1 extension mods or for users having issues.

Fixes that impact game saves entail any sort of changes to things that the game writes to the game saves. That may be something like properties of an NPC, objects in the world, quests, dialogs, the inventory and so on. Sometimes it may not be immediately apparent what is saved and what not. Dialogs for example are tricky: The condition functions (when is a dialog available or not) are *not saved*, output units (dialog lines/subtitles) *are saved*, whether a dialog is permanent *is not saved*, whether a dialog was told *is saved*, and so on. As our goal is to allow to remove the patch at any time, any such fix should not be written to the game save. Therefore, we not only need to apply but also revert all these changes every time the game is saved (and re-apply them afterwards). The same holds for new games and level changes. Applying and reverting the game save fixes is also shown in the zSpy. These fixes are a bit more complex and require more work.
