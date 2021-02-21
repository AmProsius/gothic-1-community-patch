# Gothic 1 Community Patch

Gothic is a video game that has been loved by players for 20 years. It has aged very well and continues to amaze players from all over the world. That is, among other things, because of the game's great modding capabilities. With the release of the ModKit, the developers laid the foundation of the game's big success.
But even after 20 years there are still bugs in the game. Until now, these bug could only be fixed by modifications (mods), because of the structure of the game. You had to choose between different mods that fix bugs, but most of the mods also alter the main game (introducing new features, cut content, etc). You either had to live with that or play the game without any mod, but with bugs. That is why I would like to introduce the Gothic 1 Community Patch (G1CP) today!

## What is the Gothic 1 Community Patch?
The Gothic 1 Community Patch is, as the name suggests, an extensive patch for Gothic 1 made by the community. The G1CP can be used with either the main game or with any modification that modifies or extends the main game. Additionally the patch can be activated or deactivated at any time as it does not alter savegames.

This patch only fixes bugs of the main game, it does not introduce new features or cut content. If that is of interest, one of the many existing content mods (for example the [Definitive Edition](https://forum.worldofplayers.de/forum/threads/1570176-RELEASE-Gothic-Definitive-Edition-1-4)) can be played. Note that the G1CP can still be installed with any of those mods.

It is also the intention of the patch that mods, which modify or expand the main game, can focus more on creating new content, because the bugs are already taken care of. The G1CP provides a solid base for those mods.

Please note that this is just the first release of the G1CP. Work on the patch continues as there are still some remaining bugs to be fixed. If you still encounter bugs or know of any that aren't fixed already (see [changelog](docs/changelog.md)), consider contributing to the patch by opening an [issue](https://github.com/AmProsius/gothic-1-community-patch/issues) on Github.

## Requirements 
* [Ninja](https://github.com/szapp/Ninja/releases)

## Recommendations 
* [Union](https://www.worldofgothic.de/dl/download_651.htm): Union (formerly Systempack) is a must have and fixes several engine bugs while the G1CP focuses on fixing script bugs. Bugs that are already fixed by Union are not in the scope of the G1CP.
* [Spine](https://clockwork-origins.com/de/spine/): Spine makes it easy to manage tools, patches and mods. It is also possible to install the G1CP with only one click. Another useful feature is the auto updater that automatically updates your installations like Ninja or the G1CP and keeps you up to date.

## Contributors
* **AmProsius**: Project management, quality assurance  
* **catalinux**: Provision of bug fixes from the UnPatch mod 
* **Issues**: Provision of bug fixes from the Definitive Edition mod
* **mud-freak**: Rewriting of the provided bug fixes for Ninja, management of the project repository 

---

## Building
Building the project is fully automated. VDF and NSIS setup are created in the sub-directory `build` by running `make`, `make all`, or `make remake` from Windows command prompt.

To build, the paths to the following software are required to be in the `PATH` environment variable:

 - [Make](http://gnuwin32.sourceforge.net/packages/make.htm)
 - [GothicVDFS](http://www.bendlins.de/nico/gothic2/)
 - [NSIS (Nullsoft Scriptable Install System)](https://nsis.sourceforge.io/)

The Makefile is written and supported for Windows only.
