return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_latexmk = {
			build_dir = vim.fn.expand("~/.local/share/latex"),
		}
	end,
	config = function()
		vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<cr>", { desc = "Compile LaTeX document" })
		vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "View compiled PDF" })




		-- Auto-save for LaTeX files
		vim.api.nvim_create_autocmd("TextChanged", {
			pattern = "*.tex",
			callback = function()
				vim.cmd("silent! write")
			end,
		})

		vim.api.nvim_create_autocmd("TextChangedI", {
			pattern = "*.tex",
			callback = function()
				vim.cmd("silent! write")
			end,
		})
	end,
}
