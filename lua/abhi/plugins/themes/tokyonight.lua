return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd [[colorscheme tokyonight-night]]
		require("tokyonight").setup({
			-- use the night style
			style = "night",
			-- disable italic for functions
			styles = {
				functions = {}
			},
			-- Change the "hint" color to the "orange" color, and make the "error" color bright red
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = "#ff0000"
			end
		})
	end
}
--[[

There are also colorschemes for the different styles.

colorscheme tokyonight
colorscheme tokyonight-night
colorscheme tokyonight-storm
colorscheme tokyonight-day
colorscheme tokyonight-moon

--]]
--
