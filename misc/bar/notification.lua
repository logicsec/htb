local wibox = require('wibox')
local gears = require "gears"
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local beautiful = require("beautiful")
local apps = require "main.apps"
local awful = require "awful"

notification = wibox.widget({
    text = "",
    align = "center",
    valign = "center",
    font = beautiful.icon_font .. "Round 10",
    widget = wibox.widget.textbox,
})

notification:buttons(gears.table.join(
	awful.button({ }, 1, function() 
		awesome.emit_signal("sidebar::toggle")
	end)
))


