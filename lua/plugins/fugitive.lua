return {
  "tpope/vim-fugitive",
  lazy = true,
  cmd = { "Git", "G" },
  keys = {
    { "<leader>ga", ":Git add -A<CR>", desc = "Git add all changes" }, -- Keybinding for Git add -A
  },
}
