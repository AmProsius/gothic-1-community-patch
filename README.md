# Gothic 1 Community Patch
## What is the Gothic 1 Community Patch (G1CP)?
### Goal
This patch's goal is to fix the remaining bugs of a game that is nearly 20 years old. It is not the intention of the patch to make gameplay changes or introduce new features (e.g. cut content).

### Features 
* The G1CP is compatible to every other patch and every mod that expands the main game.
* The G1CP is compatible with existing save games, no new game has to be started. We recommend to start a new game though, because some fixes wouldn't be applied otherwise.
* The G1CP can be uninstalled at any time. Existing save games can be played further without the patch.

### Requirements 
* Ninja 

### Recommendations 
* Union 
* Spine 

## Contributors
* AmProsius
* catalinstoian
* Issues
* mud-freak

## Building
Building the project is fully automated. VDF and NSIS setup are created in the sub-directory `build` by running `make`, `make all`, or `make remake` from Windows command prompt.

To build, the paths to the following software are required to be in the `PATH` environment variable:

 - [Make](http://gnuwin32.sourceforge.net/packages/make.htm)
 - [GothicVDFS](http://www.bendlins.de/nico/gothic2/)
 - [NSIS (Nullsoft Scriptable Install System)](https://nsis.sourceforge.io/)

The Makefile is written and supported for Windows only.
