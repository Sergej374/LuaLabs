#!/bin/lua5.3
--Bezuglyi 474

lgi = require'lgi'

gtk = lgi.Gtk
gtk.init()

builder = gtk.Builder()
builder:add_from_file('lab-02.glade')

ui = builder.objects

a = 0
b = 0

function checkNums()
	a = tonumber(ui.box_firstNum.text)
	b = tonumber(ui.box_secondNum.text)
if(a == nil or b == nil) then
	ui.lbl_result.label = "input error"
	return false
else 
return true
end
end

function ui.btn_add:on_clicked(...)
	if(checkNums()) then
	ui.lbl_result.label = a + b
end
end

function ui.btn_sub:on_clicked(...)
	if(checkNums())then
	ui.lbl_result.label = a - b
	end
end

function ui.btn_mul:on_clicked(...)
	if(checkNums())then
	ui.lbl_result.label = a * b
	end
end

function ui.btn_div:on_clicked(...)
	if(checkNums())then
	ui.lbl_result.label = a / b
	end
end

function ui.btn_pow:on_clicked(...)
	if(checkNums())then 
	ui.lbl_result.label = a ^ b
	end
end

function ui.btn_sqrt:on_clicked(...)
	if(checkNums())then
	ui.lbl_result.label = math.sqrt(a)
	end
end

function ui.btn_min:on_clicked(...)
	if(checkNums())then
	ui.lbl_result.label = math.min(a, b)
	end
end

function ui.btn_max:on_clicked(...)
	if(checkNums())then
	ui.lbl_result.label = math.max(a, b)
	end
end

function ui.btn_log:on_clicked(...)
	if(checkNums())then
	ui.lbl_result.label = math.log(a) / math.log(b)
	end
end

ui.wnd.title = 'lab-02-Bezuglyi-474'
ui.wnd.on_destroy = gtk.main.quit
ui.wnd:show_all()

gtk.main()
