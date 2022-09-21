local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local naughty = require "naughty"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi

-- Colors
local colors = {
	beautiful.magenta,
	beautiful.red,
	beautiful.yellow,
	beautiful.green,
	beautiful.blue
}

local function update_tag(item, tag, index)
	if tag.selected then
		item:get_children_by_id("tag")[1].markup = "<span foreground='"..beautiful.htb1.."'></span>"
	elseif #tag:clients() > 0 then
		item:get_children_by_id("tag")[1].markup = "<span foreground='"..beautiful.htb2.."'></span>"
	else
		item:get_children_by_id("tag")[1].markup = "<span foreground='"..beautiful.htb4.."'></span>"
	end
end

local button = awful.button({ }, 1, function(t) t:view_only() end)

return function(s)

	local tag = awful.widget.taglist {
		screen = s,
		filter  = awful.widget.taglist.filter.all,
		buttons = button,
		layout   = {
			spacing = dpi(20),
			layout = wibox.layout.fixed.horizontal,
		},
		style = {
			spacing = dpi(30),
		},
		widget_template = {
			id = "tag",
			font = beautiful.icon_font,
			widget = wibox.widget.textbox,
			forced_width = dpi(20),

			create_callback = function(self, c3, index, object)
				update_tag(self, c3, index)
			end,

			update_callback = function(self, c3, index, object) 
				update_tag(self, c3, index)
			end
		}
	}

	local widget = {
		bg = beautiful.htb5,
		shape = gears.shape.rounded_rect,
		{
			tag,
			margins = { left = dpi(20), right = dpi(20), top = dpi(5), bottom = dpi(5) },
			widget = wibox.container.margin
		},
		widget = wibox.container.background,
	}

	return wibox.widget({
		widget,
		margins = { left = dpi(10), right = dpi(10), top = dpi(5), bottom = dpi(5) },
		widget = wibox.container.margin,
	})

end
