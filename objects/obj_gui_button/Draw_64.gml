// String Width & Height
var _width = string_length(text);
var _height = FONT_HEIGHT;

// Getting the Width & Height of the Text Sprite
var _tw = FONT_WIDTH;
var _th = FONT_HEIGHT;	// * 1.5; -- Not Needed

if (do_fixed_width)
{
	image_xscale = width;
}

// Draw
if (draw_gui)
{
	draw_self();
	
	if (do_image_button)
	{
		image_xscale = 2;
		image_yscale = 2;
		f_draw_text_font(x, y+90, text, size, color, fa_top, fa_center);
	}
	else
	{
		image_xscale = (_width*_tw + 80) / 100;
		image_yscale = _height/_th;
		f_draw_text_font(x, y+5, text, size, color, fa_middle, fa_center);
	}
}

draw_gui = true;