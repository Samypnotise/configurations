return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✔",
					package_pending = "֎",
					package_uninstalled = "✘",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = true,
			-- list of servers for mason to install
			ensure_installed = {
				"angularls",
				"bashls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"prismals",
				"ast_grep", -- Dart, JavaScript, JSX, Kotlin
				"dockerls",
				"eslint",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd",
				"stylua", -- lua formatter
				"eslint",
			},
		})
	end,
}
