local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local beautiful = require "beautiful"

local dpi = beautiful.xresources.apply_dpi

-- Get widgets
local clock = require "misc.bar.clock"
local separator = require "misc.helpers.separator"
local volume = require "misc.bar.volume"
local launcher = require "misc.bar.launcher"
local menu = require "misc.bar.menu"
local tag = require "misc.bar.tag"
local console = require "misc.bar.console"
require "misc.bar.vpn"
require "misc.bar.mem"
require "misc.bar.cpu"
require "misc.bar.notification"
require "misc.bar.power"


-- Info Widgets
local info = wibox.widget {
	{
		{
			{
				mem_text,
				mem_value,
				cpu_text,
				cpu_value,
				spacing = dpi(6),
				layout = wibox.layout.fixed.horizontal,
			},
			margins = {top = dpi(2), bottom = dpi(2), left = dpi(0), right = dpi(2)},
			widget = wibox.container.margin,
		},
		widget = wibox.container.background,
	},
	margins = {top = dpi(6), bottom = dpi(6)},
	widget = wibox.container.margin,
}

-- Top Left
local function top_left(s) 
	return wibox.widget {
		{
			launcher,
			tag(s),
			console,
			layout = wibox.layout.fixed.horizontal,
		},
		margins = {top = dpi(4), bottom = dpi(4), left = dpi(20)},
		widget = wibox.container.margin,
	}
end

-- Bottom Left
local function bottom_left(s) 
	return wibox.widget {
		{
			vpn_text,
			vpn_ip,
			layout = wibox.layout.fixed.horizontal,
		},
		margins = {top = dpi(4), bottom = dpi(4), left = dpi(20)},
		widget = wibox.container.margin,
	}
end

-- Right
local top_right = wibox.widget {
	{
		info,
		separator,
		notification,
		power,
		spacing = dpi(10),
		layout = wibox.layout.fixed.horizontal,
	},
	margins = {top = dpi(4), bottom = dpi(4), right = dpi(20)},
	widget = wibox.container.margin,
}


-- Bar
local function top_bar(s)

	local bar = wibox {
		visible = true,
		ontop = false,
		width = s.geometry.width,
		height = beautiful.bar_height,
		placement = function(c)
			awful.placement.top(c)
		end,
		bg = beautiful.htb3,
		type = 'dock'
	}

	bar:struts { bottom = dpi(20), top = dpi(40), left = dpi(5), right = dpi(5) }

	bar : setup {
		top_left(s),
		{
			nil,
			clock,
			expand = 'none',
			layout = wibox.layout.align.horizontal,
		},
		top_right,
		layout = wibox.layout.align.horizontal,
	}
end

local function bottom_bar(s)

	local bar = wibox {
		visible = true,
		ontop = false,
		width = s.geometry.width,
		height = beautiful.bar_height,
		y = s.geometry.height - beautiful.bar_height,
		bg = beautiful.htb3,
		type = 'dock'
	}

	bar : struts { bottom = dpi(40), top = dpi(20), left = dpi(5), right = dpi(5) }

	bar : setup {
		bottom_left(s),
		layout = wibox.layout.align.horizontal,
	}
end

awful.screen.connect_for_each_screen(function(s)
	top_bar(s)
	bottom_bar(s)
end)
