----------------------------------------------
-- Nova awesome theme , forked from default --
----------------------------------------------

theme = {}

theme.font          = "Sans 12"

theme.bg_normal     = "#000000";
theme.bg_focus      = "#000000"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#F2f2f2"
theme.fg_focus      = "#00CCFF"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#a1a1a1"
theme.border_focus  = "#00ccFF"
theme.border_marked = "#91231c"

theme.useless_gap_width = 10

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
--theme.taglist_squares_sel   = "~/.config/awesome/nova/taglist/squarefw.png"
--theme.taglist_squares_unsel = "~/.config/awesome/nova/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "~/.config/awesome/nova/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "~/.config/awesome/nova/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "~/.config/awesome/nova/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/nova/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/nova/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/nova/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/nova/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/nova/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/nova/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/nova/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/nova/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/nova/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/nova/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/nova/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "~/.config/awesome/nova/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/nova/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/nova/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/nova/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/nova/titlebar/maximized_focus_active.png"

theme.wallpaper = "~/.config/awesome/nova/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = "~/.config/awesome/nova/layouts/fairhw.png"
theme.layout_fairv = "~/.config/awesome/nova/layouts/fairvw.png"
theme.layout_floating  = "~/.config/awesome/nova/layouts/floatingw.png"
theme.layout_magnifier = "~/.config/awesome/nova/layouts/magnifierw.png"
theme.layout_max = "~/.config/awesome/nova/layouts/maxw.png"
theme.layout_fullscreen = "~/.config/awesome/nova/layouts/fullscreenw.png"
theme.layout_tilebottom = "~/.config/awesome/nova/layouts/tilebottomw.png"
theme.layout_tileleft   = "~/.config/awesome/nova/layouts/tileleftw.png"
theme.layout_tile = "~/.config/awesome/nova/layouts/tilew.png"
theme.layout_tiletop = "~/.config/awesome/nova/layouts/tiletopw.png"
theme.layout_spiral  = "~/.config/awesome/nova/layouts/spiralw.png"
theme.layout_dwindle = "~/.config/awesome/nova/layouts/dwindlew.png"

theme.lain_icons         = os.getenv("HOME") .. "/.config/awesome/lain/icons/layout/default/"
theme.layout_uselesstile = "~/.config/awesome/nova/layouts/tilew.png"
theme.layout_uselessfair = theme.lain_icons .. "termfairw.png"
theme.layout_cascade     = theme.lain_icons .. "cascadew.png"
theme.layout_cascadetile = theme.lain_icons .. "cascadetilew.png"
theme.layout_centerwork  = theme.lain_icons .. "centerworkw.png"
theme.layout_termfair    = theme.lain_icons .. "termfair.png"

theme.awesome_icon = "/nix/store/7dljrx71rvkvm2sh9wigxlxgiqxzwyvn-awesome-3.5.8/share/awesome/icons/awesome16.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
