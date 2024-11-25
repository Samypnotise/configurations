-- Tokyonight theme
-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "storm",
-- 			on_colors = function(colors) end,
-- 			on_highlights = function(highlights, colors) end,
-- 		})
-- 		vim.cmd("colorscheme tokyonight")
-- 	end,
-- }

-- Kanagawa theme
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanagawa").setup({})
-- 		vim.cmd("colorscheme kanagawa-wave")
-- 	end,
-- }

return {
	"catppuccin/nvim",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			color_overrides = {
				macchiato = {
					pink = "#9D9DFF",
					red = "#F96F6F",
					teal = "#EED59E",
				},
			},
		})
		vim.cmd("colorscheme catppuccin-macchiato")
	end,
}
