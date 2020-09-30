#!/bin/lua5.3
--Bezuglyi 474

lgi = require'lgi'

gtk = lgi.Gtk
gtk.init()

builder = gtk.Builder()
builder:add_from_file('lab-03.glade')

ui = builder.objects

ui.wnd.title = 'lab-03-Bezuglyi-474'
ui.wnd.on_destroy = gtk.main.quit
ui.wnd:show_all()

gtk.main()
