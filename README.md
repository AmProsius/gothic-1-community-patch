# Gothic 1 Community Patch
## What is the Gothic 1 Community Patch (G1CP)?
### Goal
This patch's goal is to fix the remaining bugs of a game that is nearly 20 years old. It is not the intention of the patch to make gameplay changes or introduce new features (e.g. cut content).
### Compatibility
The patch should be compatible with the following software:
* Union
* D3D11 Renderer
* Spine
## Contributors
* AmProsius
* Bonne
* catalinux
* mud-freak

## Building
Building the project is fully automated. VDF and NSIS setup are created in the sub-directory `build` by running `make`, `make all`, or `make remake` from Windows command prompt.

To build, the paths to the following software are required to be in the `PATH` environment variable:

 - [Make](http://gnuwin32.sourceforge.net/packages/make.htm)
 - [GothicVDFS](http://www.bendlins.de/nico/gothic2/)
 - [NSIS (Nullsoft Scriptable Install System)](https://nsis.sourceforge.io/)

The Makefile is written and supported for Windows only.
