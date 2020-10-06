#!/bin/lua5.3
--Bezuglyi 474

lgi = require'lgi'

gtk = lgi.Gtk
pixbuf = lgi.GdkPixbuf.Pixbuf
gtk.init()

builder = gtk.Builder()
builder:add_from_file('lab-04.glade')

ui = builder.objects

function ui.btnAdd:on_clicked(...)
	name = ui.boxName.text
	value = tonumber(ui.boxValue.text)

	px = pixbuf.new_from_file('png/' .. ui.picNameBox.text .. '.png')

	i = ui.mdl_items:append()
	ui.mdl_items[i] = {[1] = name, [2] = value, [3] = px }
end
	
rdr_txt = gtk.CellRendererText {}
rdr_pix = gtk.CellRendererPixbuf {}

col1 = gtk.TreeViewColumn { title = 'Name', {rdr_txt, { text = 1}} }
col2 = gtk.TreeViewColumn { title = 'Value', {rdr_txt, { text = 2}} }
col3 = gtk.TreeViewColumn { title = 'Image', {rdr_pix, { pixbuf = 3}} }

ui.list_items:append_column(col1)
ui.list_items:append_column(col2)
ui.list_items:append_column(col3)


ui.wnd.title = 'lab-04-Bezuglyi-474'
ui.wnd.on_destroy = gtk.main.quit
ui.wnd:show_all()


gtk.main()
