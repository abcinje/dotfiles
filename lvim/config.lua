-- Options
vim.opt.background = "light"
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars:append({ tab = '» ', trail = '·' })
vim.opt.relativenumber = true
vim.opt.title = false
vim.opt.wrap = true
vim.opt.wrapscan = false

-- Keymap
vim.keymap.set("i", "jk", "<Esc>")

-- Core
lvim.builtin.indentlines.active = false

-- Plugins
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

  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },

  {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      lvim.colorscheme = "zenwritten"
    end,
  },
}
