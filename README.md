# RS Ignition

A realistic vehicle ignition resource for FiveM.

## Features
- Works across vehicle classes
- ox_lib notifications
- Configurable keybind
- Debug logging
- Keeps the vehicle running when exiting if it was running
- Prevents auto-start when entering a vehicle that is already off

## Installation
1. Place `rs-ignition` in your server resources folder.
2. Make sure `ox_lib` is installed.
3. Add `ensure ox_lib` before `ensure rs-ignition` in your server config.
4. Adjust `config.lua` if needed.

## Configuration
- `Config.Debug` enables console debug output.
- `Config.Notifications` enables `ox_lib` notifications.
- `Config.ToggleKey` sets the engine toggle control.

## Notes
- Requires `ox_lib`.
- Uses `ox_lib` notifications.
- Includes version check in `server.lua`.

## License

MIT License © 2026 Realistic Scripts