return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	keys = {
		vim.keymap.set("n", "<leader>ten", ":TestNearest<CR>", { desc = "Run nearest test" }),
		vim.keymap.set("n", "<leader>tef", ":TestFile<CR>", { desc = "Test the whole file" }),
		vim.keymap.set("n", "<leader>tes", ":TestSuite<CR>", { desc = "Run test suite" }),
		vim.keymap.set("n", "<leader>tel", ":TestLast<CR>", { desc = "Run last test" }),
		-- vim.keymap.set("n", "<leader>tev", ":TestVisit<CR>"),
	},
	config = function()
		vim.cmd("let test#strategy = 'vimux'")
	end,
}
