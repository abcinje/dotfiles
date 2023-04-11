vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { trail = '·' }
vim.opt.relativenumber = true
vim.opt.title = false
vim.opt.wrap = true
vim.opt.wrapscan = false

vim.keymap.set("i", "jk", "<Esc>")

lvim.plugins = {
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup()
    end,
  },

  {
    "f-person/git-blame.nvim",
    event = { "BufNewFile", "BufRead" },
  },

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
}
