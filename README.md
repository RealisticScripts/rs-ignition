# RS Ignition

A realistic vehicle ignition resource for FiveM.

## Features
- Works across vehicle classes
- Native GTA notifications
- Configurable keybind
- Debug logging
- Keeps the vehicle running when exiting if it was running
- Prevents auto-start when entering a vehicle that is already off

## Installation
1. Place `rs-ignition` in your server resources folder.
2. Add `ensure rs-ignition` to your server config.
3. Adjust `config.lua` if needed.

## Configuration
- `Config.Debug` enables console debug output.
- `Config.Notifications` enables native GTA feed notifications.
- `Config.ToggleKey` sets the engine toggle control.

## Notes
- No `ox_lib` dependency.
- Uses native GTA notifications.
- Includes version check in `server.lua`.

## License
MIT
