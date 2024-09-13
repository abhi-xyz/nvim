return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-------------------------------------------------------
		-- basic telescope configuration: From Documentation --
		-------------------------------------------------------
		local harpoon = require("harpoon")
		harpoon:setup({})

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end
		-------------------------------------------------------
		-- Keymaps --------------------------------------------
		-------------------------------------------------------
		vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add file to hasrpoon" })
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle quick menu" })
		vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle quick menu" })
		vim.keymap.set("n", "<leader>ht", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window in telescope ui" })
		-- WindowManager like jumping
		vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Jump to file number 1" })
		vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Jump to file number 2" })
		vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Jump to file number 3" })
		vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Jump to file number 4" })
		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Jump to previous file" })
		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Jump to next file" })
	end,
}
