#!/bin/lua5.3
--Bezuglyi 474

lgi = require'lgi'

gtk = lgi.Gtk
gtk.init()

builder = gtk.Builder()
builder:add_from_file('lab-05.glade')

ui = builder.objects

function ui.btn_open:on_clicked(...)
	ui.window2:show_all()
end

function ui.btn_close:on_clicked(...)
	ui.window2:hide()
end	

dialogWindow = gtk.MessageDialog
{
	message_type = gtk.MessageType.INFO,
	buttons = gtk.ButtonsType.OK,
	text = 'This is a message dialog',
	secondary_text = 'Bezuglyi-474'
}

function ui.btn_openDialog:on_clicked(...)
	dialogWindow:run()
	dialogWindow:hide()
end

ui.window1.on_destroy = gtk.main.quit
ui.window1:show_all()
gtk.main()
