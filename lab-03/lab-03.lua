#!/bin/lua5.3
--Bezuglyi 474

lgi = require'lgi'

gtk = lgi.Gtk
gtk.init()

builder = gtk.Builder()
builder:add_from_file('lab-03.glade')

ui = builder.objects

rads = {ui.radbutA, ui.radbutB, ui.radbutC, ui.radbutD}

function update()
	x = 0
	y = 0
	if ui.boxX.active == true then x = 1 end
	if ui.boxY.active == true then y = 1 end
	
	v = x + y * 2
	rads[v + 1].active = true

	ui.labelRes.label = v
end

function ui.boxX:on_clicked(...)
	update()
end

function ui.boxY:on_clicked(...)
	update()
end


ui.wnd.title = 'lab-03-Bezuglyi-474'
ui.wnd.on_destroy = gtk.main.quit
ui.wnd:show_all()

update()

gtk.main()
