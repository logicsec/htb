local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local beautiful = require "beautiful"

-- Clock
local clock = wibox.widget.textbox()
clock.font = beautiful.font

gears.timer {
	timeout = 60,
	autostart = true,
	call_now = true,
	callback = function()
		clock.markup = "<span foreground='"..beautiful.htb1.."'>"..os.date("%I:%M %p").."</span>"
	end
}

return clock
