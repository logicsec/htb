local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi

-- Separator
local separator = wibox.widget.textbox()
separator.font = beautiful.font
separator.margins = dpi(3)
separator.size = 14
separator.text = "|"


return separator