local wibox = require('wibox')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")
local awful = require "awful"

disk_text = wibox.widget.textbox()
disk_text.markup= "HDD"

disk_value = wibox.widget.textbox()
watch(
    "sh -c ~/.config/awesome/scripts/disk.sh", 2,
    function(widget, stdout, stderr, exitreason, exitcode)
        disk_value.markup = "<span foreground='" .. beautiful.htb1 .."'>".. stdout .."</span>" 
    end
)


