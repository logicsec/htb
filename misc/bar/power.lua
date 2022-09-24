local wibox = require('wibox')
local gears = require "gears"
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local beautiful = require("beautiful")
local apps = require "main.apps"
local awful = require "awful"


local powermenu = require("main.power-menu")
power = wibox.widget({
    text = "",
    align = "center",
    valign = "center",
    font = beautiful.icon_font .. "Round 10",
    widget = wibox.widget.textbox,
})

power:buttons(gears.table.join(
	awful.button({ }, 1, function() 
		powermenu:toggle()
	end)
))

power:connect_signal("mouse::enter", function()
	power.opacity = 0.5
end)

power:connect_signal("mouse::leave", function()
	power.opacity = 1.0
end)
