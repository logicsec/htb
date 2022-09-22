local awful = require "awful"
local wibox = require "wibox"
local gears = require "gears"
local gfs = require "gears.filesystem" 
local apps = require "main.apps"
local beautiful = require "beautiful"
local icons_path = gfs.get_configuration_dir() .. "icons/"

local power_icon = icons_path.."apower.svg"

local instance = nil


local function widget()
	return awful.menu {
		items = {
			{ "Poweroff", function() awful.spawn("poweroff", false) end },
			{ "Reboot", function() awful.spawn("reboot", false) end },
			{ "Logout", function() awesome.quit() end }
		},
	}
end

if not instance then
	instance = widget()
	instance.wibox.shape = function(cr,w,h) 
		gears.shape.rounded_rect(cr,w,h,8)
	end
end
return instance