return {
	{
		"mattn/emmet-vim",
		ft = { "html", "css", "javascript", "rust" }, -- Load Emmet for these file types
		config = function()
			vim.g.user_emmet_leader_key = '<C-y>'     -- Default is '<C-y>'
		end,
	},
}
