<div align="center">

[![logo](https://github.com/AmProsius/gothic-1-community-patch/assets/20203034/06eb6356-94e6-4dec-bb6f-1ae28ec2692b)](https://github.com/AmProsius/gothic-1-community-patch)  
# Gothic 1 Community Patch

[![Syntax](https://github.com/AmProsius/gothic-1-community-patch/actions/workflows/syntax.yml/badge.svg)](https://github.com/AmProsius/gothic-1-community-patch/actions/workflows/syntax.yml)
[![Implemeted fixes](https://img.shields.io/github/directory-file-count/AmProsius/gothic-1-community-patch/src%2FNinja%2FG1CP%2FContent%2FTests?type=file&extension=d&label=fixes&color=yellow)](https://github.com/AmProsius/gothic-1-community-patch/blob/master/CHANGELOG.md)
[![GitHub Release](https://img.shields.io/github/v/release/AmProsius/gothic-1-community-patch)](https://github.com/AmProsius/gothic-1-community-patch/releases)
[![Downloads](https://api.szapp.de/downloads/g1cp/total/badge)](https://github.com/AmProsius/gothic-1-community-patch/releases)  
[![Steam Gothic 1](https://img.shields.io/badge/steam-workshop-2a3f5a?logo=steam&labelColor=1b2838)](https://steamcommunity.com/sharedfiles/filedetails/?id=2789245548)

</div>

Gothic is a video game that is still loved by players after 20 years. Despite its success, there remain some bugs in the game. These are addressed by a variety of modifications (mods) that, unfortunately, also introduce other changes and are mutually exclusive. For the first time, the Gothic 1 Community Patch (G1CP) overcomes these shortcomings.

- The G1CP solely fixes story and script bugs in the game and does not introduce any other changes.
- The G1CP is completely language independent.
- The G1CP is a modular patch that can be used alongside other mods and patches.
- The G1CP may be added or removed from the game at any time without repercussions on the saved game.

## What is the Gothic 1 Community Patch?
The Gothic 1 Community Patch is - as the name suggests - an extensive patch for Gothic 1 made by the community. As it addresses bugs in the story and general script bugs, it is suitable for the main game, as well as any mod that modifies or extends the main game. The patch works for any localization of the game and is not language dependent. Additionally, the patch can be activated or deactivated at any time as it does not alter savegames.

Unlike other mods, this patch only fixes bugs of the main game. For new features or cut content we kindly refer to the many great existing content mods. Note that the G1CP runs well with any of those mods, as it strives to offer a very high level of compatibility.

Due to its great compatibility but concise reach of changes, the G1CP offers a solid base for playing Gothic 1 in general. The intention is to allow mods to focus on creating new content, while the bugs are already taken care of.

Please note that this is the first release of the G1CP. Work on the patch continues as there still remain bugs to be fixed. If you encounter bugs or know of any that aren't addressed already (see [changelog](CHANGELOG.md)), consider contributing to the patch by opening an [issue](../../issues?q=sort:updated-desc) on Github.

## Requirements 
* Gothic version [1.08k_mod](https://www.worldofgothic.de/dl/download_34.htm)
* [Ninja](https://github.com/szapp/Ninja/releases) >= 2.3.08

## Recommendations 
* [Union](https://www.worldofgothic.de/dl/download_651.htm): Union (formerly Systempack) is highly recommended as it fixes several engine bugs while the G1CP focuses on fixing script bugs. Bugs that are already fixed by Union are not in the scope of the G1CP.
* [Spine](https://clockwork-origins.com/de/spine/): Spine makes it easy to manage tools, patches and mods. It enables to install the G1CP with just one click. Another useful feature is the auto-updater that always keeps your version of the G1CP up to date.

## Contributors
[![Contributors](https://contrib.rocks/image?repo=AmProsius/gothic-1-community-patch)](https://github.com/AmProsius/gothic-1-community-patch/graphs/contributors)

## Supporters
![Supporters](https://api.szapp.de/participants/g1cp/total/svg?wog=[Blubbler,Spatzendame,rvblacktail,gothicfan0,Homerclon])

## Sources of Inspiration

* *Gothic Unofficial Patch* by Ironkeep Studio
* *Gothic UnPatch* by catalinux
* *Perfect Gothic* by AndiNo
* *Liste der Ungereimtheiten in G1* by Oparilames
* *Gothic Bugliste* by Sowilo
* *Bugs from Gothic 1 You'd Want To See Fixed* by Korianous
* *Definitive Edition* by Issues

## FAQ 
* **What kind of bugs are addressed exactly?** The G1CP fixes any bugs in the scripts. These range from problems in the script AI of NPCs, over item descriptions and broken dialogs, all the way to story bugs of the main game.
* **Do I have to start a new game when I install/update the G1CP?** No, you will never have to start a new game. The G1CP can be installed, updated and removed at any time. Any fix is provided no matter how far you are progressed in the story. The patch is conceptualized to be compatible with any existing savegames.
* **Can I continue the game without the patch after installing it once?** The G1CP leaves no noticeable trace in savegames. The game can be continued without issues after uninstalling the patch. Likewise, the patch can be re-added at any time should you change your mind.
* **How do you ensure the compatibility with other mods and patches?** The G1CP prioritizes compatibility over bug fixing. A number of safety layers ensure that a fix is only applied if it was not addressed already. This way, if a mod already fixed the bug, the G1CP will not intervene.
* **How is the G1CP possible? Why did it take 20 years for such a patch?** The G1CP mostly consists of what you would call metaprogramming of the scripts (dynamic analysis and self-modifying code) which was made possible in Gothic around ten years ago. This is essentially what powers the G1CP. The last piece of the puzzle was recent advances that allow modular script patches, but that is just the packaging. For more details, have a look at how the fixes are [implemented in a modular way](docs/modularity.md).
* **When starting the game I receive an error that says "Access Violation". What now?** Please double check that you have installed the Gothic version [1.08k_mod](https://www.worldofgothic.de/dl/download_34.htm) and have disabled the 
"Data Execution Prevention" (DEP) for the Gothic executables in your system settings of Microsoft Windows. For instruction on that we kindly refer to the [Spine FAQ](https://clockwork-origins.com/spine/#faq-question-1576926774006).
* **How do I know the G1CP is active?** On successful installation the version number of the G1CP is displayed at the bottom left of the main menu in the game. If it is not shown, please try [troubleshooting your installation](https://github.com/szapp/Ninja/wiki/Troubleshooting-(EN)#wiki-wrapper) of the patch.
* **How do I know a certain fix is actually applied in my game?** As mentioned, the G1CP only applies individual fixes if their corresponding bug is detected in the game. (They might have been addressed already by a mod.) Therefore, it may happen that a fix is not applied. To obtain a list of applied and not applied fixes, consult the G1CP [console commands](docs/console.md).
* **Can I disable individual bug fixes?** We try to make sure that all our changes are actually fixing *objective* bugs in the game. If you encounter a bug fix that is undesired or breaks the functionality of the game/mod, please let us now. We are committed to provide hot-fixes for the G1CP ASAP. Until we manage, there is a way to disable individual fixes. Please contact us and we will explain how that can be done.
* **How can I report a bug?** The best way is to have a look at the Github repository and see, if there is already an opened issue for the bug. If not, you are welcome to open an issue yourself. Keep in mind that we won't fix bugs that were introduced by other mods or patches, but only bugs of the vanilla game and the G1CP. We also do not add any new or restore cut content.
* **How can I contribute?** Providing detailed descriptions and possibly even ideas or script changes on how to fix the issue are a great help. You can do so by opening an [issue](../../issues?q=sort:updated-desc) on Github. Although pull requests are an option too they might be difficult to draft as all changes of the G1CP require scripting in a modular way. Read on for more details on how to [contribute](docs/contributing.md).
* **Can I use portions of the G1CP in my mod?** We don't see the need to do so, as the patch should be universally applicable to any installation. Furthermore, due to their modular implementation the scripts are not suitable for mods. If you insist, it is very important to change all names of functions and variable, i.e. remove or replace their `G1CP_...` prefix. This is inevitable to avoid conflicts with the patch! Additionally, we appreciate the mentioning the original author (G1CP team) clearly of any copied or modified material.

---

## Building
Building the project is fully automated. VDF and NSIS setup are created in the sub-directory `build` by running Make in the Windows command prompt. The rules `make`, `make all`, and `make remake` invoke `make dev` which builds the development version of the VDF. The development version includes the test suite. To build the release version (including building the NSIS setup) use `make release`.

To build, the paths to the following software are required to be in the `PATH` environment variable:

 - [Make](http://gnuwin32.sourceforge.net/packages/make.htm)
 - [GothicVDFS](http://www.bendlins.de/nico/gothic2/)
 - [NSIS (Nullsoft Scriptable Install System)](https://nsis.sourceforge.io/) including the [MoreInfo plug-in](https://nsis.sourceforge.io/MoreInfo_plug-in)

The Makefile is written and supported for Windows only.
