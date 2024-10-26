return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "storm",
			on_colors = function(colors) end,
			on_highlights = function(highlights, colors) end,
		})
		vim.cmd("colorscheme tokyonight")
	end,
}
