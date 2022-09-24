local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi

local apps = require "main.apps"

local launcher = wibox.widget.imagebox()
launcher.image = beautiful.htb_asset .. "htb.svg"
launcher.resize = true
launcher.forced_height = 15
launcher.forced_width = 15
launcher.valign = "center"

launcher:connect_signal("mouse::enter", function()
	launcher.opacity = 0.5
end)

launcher:connect_signal("mouse::leave", function()
	launcher.opacity = 1.0
end)

launcher:buttons(gears.table.join(
	awful.button({ }, 1, function() 
		awful.spawn(apps.launcher, false)
	end)
))

return launcher
