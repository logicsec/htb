local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi
local apps = require "main.apps"

-- Terminal
local console = wibox.widget.imagebox()
console.image = beautiful.htb_asset .. "console.svg"
console.resize = true
console.orced_height = 25
console.forced_width = 25
console.valign = "center"

console:buttons(gears.table.join(
	awful.button({ }, 1, function() 
		awful.spawn(apps.console, false)
	end)
))


return console