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

-- Info Widgets
local info = wibox.widget {
	{
		{
			{
				volume,
				---wifi,
				spacing = dpi(6),
				layout = wibox.layout.fixed.horizontal,
			},
			margins = {top = dpi(2), bottom = dpi(2), left = dpi(6), right = dpi(6)},
			widget = wibox.container.margin,
		},
		shape = function(cr,w,h) gears.shape.rounded_rect(cr,w,h,8) end,
		bg = beautiful.bg_alt,
		widget = wibox.container.background,
	},
	margins = {top = dpi(6), bottom = dpi(6)},
	widget = wibox.container.margin,
}

-- Left
local function left(s) 
	return wibox.widget {
		{
			launcher,
			tag(s),
			spacing = dpi(20),
			layout = wibox.layout.fixed.horizontal,
		},
		margins = {top = dpi(4), bottom = dpi(4), left = dpi(20)},
		widget = wibox.container.margin,
	}
end

-- Right
local right = wibox.widget {
	{
		info,
		separator,
		spacing = dpi(20),
		layout = wibox.layout.fixed.horizontal,
	},
	margins = {top = dpi(4), bottom = dpi(4), right = dpi(20)},
	widget = wibox.container.margin,
}


-- Bar
local function get_bar(s)

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

	bar:struts { bottom = dpi(20), top = dpi(60), left = dpi(20), right = dpi(20) }

	bar : setup {
		left(s),
		{
			nil,
			clock,
			expand = 'none',
			layout = wibox.layout.align.horizontal,
		},
		right,
		layout = wibox.layout.align.horizontal,
	}
end

awful.screen.connect_for_each_screen(function(s)
	get_bar(s)
end)
