# ESX Safezone Script

## Overview
This script is designed for use with the **ESX framework** in **FiveM** to create and manage safezones in the game world. The script prevents players from using weapons, fist combat, and other hostile actions within the defined safezones. Additionally, it notifies players when they enter or exit a safezone.

## Features
- **Safezone Detection**: Notifies players when they enter or exit a safezone.
- **Safezone Restrictions**: Disables weapons and fist combat within safezones, but players can still sprint and run.
- **Customizable Safezones**: Safezones are easily configurable within the `Config.SafeZones` array.

## Installation

1. **Download the Script**: Download the script and place it in your `resources` folder.

2. **Add to `server.cfg`**: Add the following line to your `server.cfg` to ensure the script is loaded:

3. **Configure Safezones**: Open the script and define your safezones within the `Config.SafeZones` array. Each safezone needs the following properties:
- `name`: A unique name for the safezone.
- `coords`: The coordinates (x, y, z) for the center of the safezone.
- `radius`: The radius around the center (in meters) that will be considered part of the safezone.

Example configuration:
```lua

Config.SafeZones = {
    {
        name = "Hospital",  -- Name of the safezone
        coords = vector3(271.9975, -576.7407, 43.2175),  -- Coordinates of the safezone center
        radius = 20.0,  -- Radius of the safezone in meters
    },
    {
        name = "SafeZone2",  -- Name of another safezone
        coords = vector3(-275.0615, -889.9359, 31.0806),  -- Coordinates of the safezone center
        radius = 15.0,  -- Radius of the safezone in meters
    },
}