-- This plugin allows you to capture screenshots of your selected code and share them with ray.so
return {
	"TobinPalmer/rayso.nvim",
	config = function()
		local rayso = require("rayso")
		rayso.setup({
			base_url = "https://ray.so/",
			open_cmd = "arc",
			options = {
				background = true,
				dark_mode = true,
				logging_path = "",
				logging_file = "rayso",
				logging_enabled = false,
				padding = 32,
				theme = "candy",
				title = "Infyneis ∞",
			},
		})
	end,
	keys = {
		{ "<leader>cs", "<cmd>Rayso<CR>", mode = "v", desc = "Capture screenshot with rayso" },
	},
}
