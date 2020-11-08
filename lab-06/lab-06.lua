lgi = require'lgi'
sqlite = require'lsqlite3'

gtk = lgi.Gtk
pixbuf = lgi.GdkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-06.glade')

ui = bld.objects

rdr_txt = gtk.CellRendererText{}
rdr_pix = gtk.CellRendererPixbuf{}

c1 = gtk.TreeViewColumn { title = 'Name', {rdr_txt, { text = 1}} }
c1 = gtk.TreeViewColumn { title = 'Value', {rdr_txt, { text = 2}} }
c1 = gtk.TreeViewColumn { title = 'Image', {rdr_pix, { pixbuf = 1}} }

ui.lst_items:append_column(c1)
ui.lst_items:append_column(c2)
ui.lst_items:append_column(c3)

db = sqlite.open('lab-06.db')

for row in db:rows('Select * From list') do 
	px = pixbuf.new_from_file(row.image)

	el = ui.stor_items:append()
	ui.stor_items[el] = { [1] = row.name, [2] = row.value, [3] = px }
end

db:Close()

ui.Window.on_destroy = gtk.main.quit
ui.Window:show_all()
gtk.main()
