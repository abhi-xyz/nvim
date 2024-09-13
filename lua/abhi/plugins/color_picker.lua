return {
	"ziontee113/color-picker.nvim",
	config = function()
		require("color-picker")
		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "<leader>cp", "<cmd>PickColor<cr>", { desc = "Pick Color" })
		vim.keymap.set("n", "<leader>ci", "<cmd>PickColorInsert<cr>", { desc = "Pick Color Insert" })
		vim.keymap.set("n", "<leader>ccr", "<cmd>ConvertHEXandRGB<cr>", { desc = "Convert HEX and RGB" })
		vim.keymap.set("n", "<leader>cch", "<cmd>ConvertHEXandHSL<cr>", { desc = "Convert HEX and HSL" })


		require("color-picker").setup({ -- for changing icons & mappings
			["icons"] = { "=", ">" },
			["border"] = "rounded",     -- none | single | double | rounded | solid | shadow
			["keymap"] = {              -- mapping example:
				["U"] = "<Plug>ColorPickerSlider5Decrease",
				["O"] = "<Plug>ColorPickerSlider5Increase",
			},
			["background_highlight_group"] = "Normal", -- default
			["border_highlight_group"] = "FloatBorder", -- default
			["text_highlight_group"] = "Normal",     --default
		})

		vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
	end,
}
