#!/bin/lua5.3
--Bezuglyi 474

lgi = require'lgi'

gtk = lgi.Gtk
cairo = lgi.cairo
gtk.init()

builder = gtk.Builder()
builder:add_from_file('lab-07.glade')

ui = builder.objects

function ui.Canvas:on_draw(cr)
	cr:set_source_rgb(0,0,0)
	cr:paint()

	for x = 1, 10 do
	for y = 1, 10 do
		cr:set_source_rgb(x/10, y/10, 0.75)
		cr:rectangle(x*30, y*30, 30, 30)
		cr:fill()
	end
	end
return true
end

ui.Window.on_destroy = gtk.main.quit
ui.Window:show_all()
gtk.main()
