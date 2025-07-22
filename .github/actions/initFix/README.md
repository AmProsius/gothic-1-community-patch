# Initialize Fix

This action prints initializes fixes from Github issues.

## Configuration

Configurable options are available in [config.json](dist/config.json). Committed changes to the file take effect immediately without the need for re-compiling the project.

## Development

The action is stored in complied form (with ncc). To modify the code, install npm and ncc and run `npm run setup` to install the necessary packages. To compile the action, run `npm run build`. The action needs to be compiled every time, there is a change in any \*.js file.
