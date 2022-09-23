local gears = require "gears"
local gfs = require "gears.filesystem" 

local apps = {
	console = "kitty",
	launcher = "rofi -show drun -theme " .. gfs.get_configuration_dir() .. "scripts/rofi/launcher_2.rasi",
	browser = "firefox",
	picture = "feh",
	fileManager = "dolphin",
	editor = "code",
	bluetooth = "blueberry",
}

return apps

