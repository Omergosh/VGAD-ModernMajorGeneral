///draw_health_bar(obj_ind, spr_ind)

/*
Draws a health bar above a character according to their %hp.
Assumes that an object's origin is its center.
*/

// TWEAK BAR VALUES
// How high should we render this above the unit?
var pad = 2;
// How tall is the bar?
var bar_h = 4;

// vv DON'T TOUCH BELOW THIS vv
// Get our args
var obj_ind = argument0;
var spr_ind = argument1;

// Get sprite dimensions
var spr_h2 = sprite_get_height(spr_ind) / 2;
var spr_w2 = sprite_get_width(spr_ind) / 2;

// Build bounding boxes of health bar
var bot = obj_ind.y - spr_h2 - pad;
var top = bot - bar_h;
var full_lft = obj_ind.x - spr_w2;
var full_rgt = obj_ind.x + spr_w2;

// Draw background
draw_set_colour(c_black);
draw_rectangle(full_lft, top, full_rgt, bot, false);

// Draw health
var scale = obj_ind.current_hp / obj_ind.max_hp;
var color = merge_color(c_red, c_green, scale);
var hp_rgt = (full_rgt - full_lft) * scale + full_lft;
draw_set_colour(color);
draw_rectangle(full_lft, top, hp_rgt, bot, false);

// Draw outline
draw_set_colour(c_black);
draw_rectangle(full_lft, top, full_rgt, bot, true);
