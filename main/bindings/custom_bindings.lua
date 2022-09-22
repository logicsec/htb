local awful = require "awful"

local apps = require "main.apps"
local volume = require "lib.volume"
local brightness = require "lib.brightness"

modkey = "Mod4"
alt = "Mod1"
ctrl = "Control"

-- Specialty
awful.keyboard.append_global_keybindings({
	awful.key({modkey}, "r", function() awful.spawn(apps.launcher, false) end), -- Rofi
	awful.key({alt}, "c", function() awesome.emit_signal("sidebar::toggle") end), -- Sidebar
	awful.key({alt}, "t", function() awful.titlebar.toggle(client.focus) end), -- Toggle titlebar
})

-- Applications
awful.keyboard.append_global_keybindings({
	awful.key({modkey}, "Return", function() awful.spawn(apps.console, false) end),
	awful.key({ctrl}, "F2", function() awful.spawn(apps.browser, false) end),
	awful.key({modkey}, "e", function() awful.spawn(apps.fileManager, false) end),
	-- awful.key({ctrl}, "F4", function() awful.spawn(apps.bluetooth, false) end),
	awful.key({ctrl}, "F5", function() awful.spawn(apps.editor, false) end),
})

-- Volume 
awful.keyboard.append_global_keybindings({
	awful.key({ }, "XF86AudioRaiseVolume", function() volume.increase() end),
	awful.key({ }, "XF86AudioLowerVolume", function() volume.decrease() end),
	awful.key({ }, "XF86AudioMute", function() volume.mute() end)
})

-- Brightness
awful.keyboard.append_global_keybindings({
	awful.key({ }, "XF86MonBrightnessUp", function() brightness.increase() end),
	awful.key({ }, "XF86MonBrightnessDown", function() brightness.decrease() end)
})
