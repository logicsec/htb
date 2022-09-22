local wibox = require('wibox')
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")
local awful = require "awful"

mem_text = wibox.widget.textbox()
mem_text.markup= "MEM"

mem_value = wibox.widget.textbox()
watch(
    "sh -c ~/.scripts/mem.sh", 2,
    function(widget, stdout, stderr, exitreason, exitcode)
        mem_value.markup = "<span foreground='" .. beautiful.htb1 .."'>".. stdout .."</span>" 
    end
)


