vim.opt.linebreak = true
vim.opt.relativenumber = true
vim.opt.title = false
vim.opt.wrap = true
vim.opt.wrapscan = false

vim.keymap.set("i", "jk", "<Esc>")

lvim.plugins = {
  {
    "folke/todo-comments.nvim",
    event = { "BufNewFile", "BufRead" },
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "ggandor/lightspeed.nvim",
    event = { "BufNewFile", "BufRead" },
  },

  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gedit",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "Glgrep",
      "GMove",
      "GRename",
      "GDelete",
      "GRemove",
      "GBrowse",
    },
    ft = { "fugitive" },
  },
}
