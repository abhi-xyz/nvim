-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- https://neovim.io/doc/user/lsp.html#vim.lsp.inlay_hint.enable()
-- vim.lsp.inlay_hint.enable() -- usefull for rust

-- Enable inlay hints globally for all buffers when a buffer is entered
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	callback = function()
		-- Enable inlay hints for the current buffer
		vim.lsp.inlay_hint.enable(true)
	end
})
-- https://vi.stackexchange.com/questions/43893/how-do-you-toggle-inlay-hints
-- lsp.inlay_hint.enable(0, not lsp.inlay_hint.is_enabled())
