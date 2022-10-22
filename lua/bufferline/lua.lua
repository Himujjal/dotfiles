vim.o.termguicolors = true

-- colors for active , inactive buffer tabs 
require "bufferline".setup {
    options = {
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 18,
        enforce_regular_tabs = true,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin"
    },
    highlights = {
        background = {
            fg = comment_fg,
            bg = "#282c34"
        },
        fill = {
            fg = comment_fg,
            bg = "#282c34"
        },
        buffer_selected = {
            fg = normal_fg,
            bg = "#3A3E44",
			bold = true
        },
        separator_visible = {
            fg = "#282c34",
            bg = "#282c34"
        },
        separator_selected = {
            fg = "#282c34",
            bg = "#282c34"
        },
        separator = {
            fg = "#282c34",
            bg = "#282c34"
        },
        indicator_selected = {
            fg = "#282c34",
            bg = "#282c34"
        },
        modified_selected = {
            fg = string_fg,
            bg = "#3A3E44"
        }
    }
}

