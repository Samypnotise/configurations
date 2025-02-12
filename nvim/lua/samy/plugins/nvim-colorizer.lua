return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = { -- set to setup table
	},
	config = function()
		local colorizer = require("colorizer")

		colorizer.setup({
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RGBA = true, -- #RGBA hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				AARRGGBB = true, -- 0xAARRGGBB hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS *features*:
				-- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
				tailwind = "normal", -- Enable tailwind colors
				tailwind_opts = { -- Options for highlighting tailwind names
					update_names = true, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
				},
				-- parsers can contain values used in `user_default_options`
				sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
				-- Highlighting mode.  'background'|'foreground'|'virtualtext'
				mode = "background", -- Set the display mode
				-- Virtualtext character to use
				virtualtext = "■",
				-- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
				virtualtext_inline = false,
				-- Virtualtext highlight mode: 'background'|'foreground'
				virtualtext_mode = "foreground",
			},
		})
	end,
}
