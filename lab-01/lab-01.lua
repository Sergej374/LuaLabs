-- Bezuglyi-474

lgi = require'lgi'

gtk = lgi.Gtk
gtk.init()

builder = gtk.Builder()
builder:add_from_file('lab-01.glade')

ui = builder.objects

ui.wnd.title = 'lab-01-Bezuglyi-474'
ui.wnd.on_destroy = gtk.main.quit
ui.wnd:show_all()

gtk.main()
