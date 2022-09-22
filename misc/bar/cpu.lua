local wibox = require('wibox')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")
local awful = require "awful"

cpu_text = wibox.widget.textbox()
cpu_text.markup= "CPU"

cpu_value = wibox.widget.textbox()
watch(
    "sh -c ~/.scripts/cpu.sh", 2,
    function(widget, stdout, stderr, exitreason, exitcode)
        cpu_value.markup = "<span foreground='" .. beautiful.htb1 .."'>".. stdout .."</span>" 
    end
)


