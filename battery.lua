require 'cairo'

function hex2rgb(hex)
	hex = hex:gsub("#","")
	return (tonumber("0x"..hex:sub(1,2))/255), (tonumber("0x"..hex:sub(3,4))/255), tonumber(("0x"..hex:sub(5,6))/255)
end

-- HTML colors
color0="#000000"
color5="#86C048"
color7="#000000"
color8="#D0DD38"
color9="#FFBD05"
color10="#EF7103"
color11="#E93939"
t0= 0.2
t0_border= 0.2
r0, g0, b0 = hex2rgb(color0)
t1= 0.8
r1, g1, b1 = hex2rgb(color5)
t2= 0.8
r2, g2, b2 = hex2rgb(color7)
t3= 0.8
r3, g3, b3 = hex2rgb(color8)
t4= 0.8
r4, g4, b4 = hex2rgb(color9)
t5= 0.8
r5, g5, b5 = hex2rgb(color10)
t6= 0.8
r6, g6, b6 = hex2rgb(color11)

function fix_text(text)
	if string.len(text) == 1 then
		new_text = "0" .. text .. "%"
		return new_text
	else
		new_text = text .. "%"
		return new_text
	end
end

function draw_circle_background(cr, w, h)
	cairo_set_source_rgba(cr, r0, g0, b0, t0)
	cairo_arc(cr,w/2,h/2,w/2-2,0*math.pi/180,360*math.pi/180)
    cairo_fill(cr)
end

function draw_circle_background_border(cr, w, h)
	cairo_set_source_rgba(cr, r0, g0, b0, t0_border)
	cairo_set_line_width(cr, 2)
	cairo_arc(cr,w/2,h/2,w/2-2,0*math.pi/180,360*math.pi/180)
    cairo_stroke(cr)
end

function draw_battery(cr, w, h)

    --Get battery
    battery_perc = tonumber(conky_parse('${battery_percent BAT0}'))
    if battery_perc >= 80 then
		--Background
		cairo_set_source_rgba(cr, r1, g1, b1, t1)
		cairo_arc(cr,w/2,h/2,w/2-20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		cairo_set_source_rgba(cr, r2, g2, b2, t2)
		cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND)
		--Left eye
		cairo_set_line_width(cr, 10)
		cairo_arc(cr,(w/2)/2,(h/2)-40,20,180*math.pi/180,360*math.pi/180)
		cairo_stroke(cr)
		--Right eye
		cairo_arc(cr,w-(w/2)/2,(h/2)-40,20,180*math.pi/180,360*math.pi/180)
		cairo_stroke(cr)
		--Mouth
		cairo_arc(cr,(w/2),(h/2)+20,110,20*math.pi/180,160*math.pi/180)
		cairo_fill(cr)
	
	elseif battery_perc >= 60 and battery_perc < 80 then
		--Background
		cairo_set_source_rgba(cr, r3, g3, b3, t3)
		cairo_arc(cr,w/2,h/2,w/2-20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		cairo_set_source_rgba(cr, r2, g2, b2, t2)
		cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND)
		--Left eye
		cairo_set_line_width(cr, 10)
		cairo_arc(cr,(w/2)/2,(h/2)-40,20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		--Right eye
		cairo_arc(cr,w-(w/2)/2,(h/2)-40,20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		--Mouth
		cairo_set_line_width(cr, 20)
		cairo_arc(cr,(w/2),(h/2)+20,110,20*math.pi/180,160*math.pi/180)
		cairo_stroke(cr)
	elseif battery_perc >= 40 and battery_perc < 60 then
		--Background
		cairo_set_source_rgba(cr, r4, g4, b4, t4)
		cairo_arc(cr,w/2,h/2,w/2-20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		cairo_set_source_rgba(cr, r2, g2, b2, t2)
		cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND)
		--Left eye
		cairo_set_line_width(cr, 10)
		cairo_arc(cr,(w/2)/2,(h/2)-40,20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		--Right eye
		cairo_arc(cr,w-(w/2)/2,(h/2)-40,20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		--Mouth
		cairo_set_line_width(cr, 20)
		cairo_move_to(cr,w/2,(h/2)+60)
		cairo_rel_line_to(cr,119,0)
		cairo_move_to(cr,w/2,(h/2)+60)
		cairo_rel_line_to(cr,-110,0)
		cairo_stroke(cr)
 	elseif battery_perc >= 20 and battery_perc < 40 then
		--Background
		cairo_set_source_rgba(cr, r5, g5, b5, t5)
		cairo_arc(cr,w/2,h/2,w/2-20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		cairo_set_source_rgba(cr, r2, g2, b2, t2)
		cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND)
		--Left eye
		cairo_set_line_width(cr, 10)
		cairo_arc(cr,(w/2)/2,(h/2)-40,20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		--Right eye
		cairo_arc(cr,w-(w/2)/2,(h/2)-40,20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		--Mouth
		cairo_set_line_width(cr, 20)
		cairo_arc(cr,(w/2),(h/2)+130,110,200*math.pi/180,340*math.pi/180)
		cairo_stroke(cr)
	elseif battery_perc < 20 then
		--Background
		cairo_set_source_rgba(cr, r6, g6, b6, t6)
		cairo_arc(cr,w/2,h/2,w/2-20,0*math.pi/180,360*math.pi/180)
		cairo_fill(cr)
		cairo_set_source_rgba(cr, r2, g2, b2, t2)
		cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND)
		--Mouth
		cairo_set_line_width(cr, 20)
		cairo_arc(cr,(w/2),(h/2)+130,110,200*math.pi/180,340*math.pi/180)
		cairo_stroke(cr)
		--Angry eye
		cairo_set_operator(cr,CAIRO_OPERATOR_SOURCE)
		cairo_move_to(cr,(w/2)/2,(h/2)-40)
		cairo_rel_line_to(cr,-20,20)
		cairo_stroke(cr)
		cairo_move_to(cr,(w/2)/2,(h/2)-40)
		cairo_rel_line_to(cr,20,-20)
		cairo_stroke(cr)
		cairo_move_to(cr,(w/2)/2,(h/2)-40)
		cairo_rel_line_to(cr,-20,-20)
		cairo_stroke(cr)
		cairo_move_to(cr,(w/2)/2,(h/2)-40)
		cairo_rel_line_to(cr,20,20)
		cairo_stroke(cr)		
		
		cairo_move_to(cr,w-(w/2)/2,(h/2)-40)
		cairo_rel_line_to(cr,-20,20)
		cairo_stroke(cr)
		cairo_move_to(cr,w-(w/2)/2,(h/2)-40)
		cairo_rel_line_to(cr,20,-20)
		cairo_stroke(cr)
		cairo_move_to(cr,w-(w/2)/2,(h/2)-40)
		cairo_rel_line_to(cr,-20,-20)
		cairo_stroke(cr)
		cairo_move_to(cr,w-(w/2)/2,(h/2)-40)
		cairo_rel_line_to(cr,20,20)
		cairo_stroke(cr)	
		
    end
end

function draw_widgets(cr)
	local w,h=conky_window.width,conky_window.height
	cairo_select_font_face (cr, "Dejavu Sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
	cairo_set_font_size(cr, 9)
	
	--Draw background
	draw_circle_background(cr, w, h)
	draw_circle_background_border(cr, w, h)
	--Draw battery
	draw_battery(cr,w,h)
	
end

function conky_start_widgets()

	if conky_window==nil then return end
	local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
	local cr=cairo_create(cs)	
	local ok, err = pcall(function () draw_widgets(cr) end)
	cairo_surface_destroy(cs)
	cairo_destroy(cr)
end
