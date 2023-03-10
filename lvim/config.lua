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
    "phaazon/hop.nvim",
    event = { "BufNewFile", "BufRead" },
    config = function()
      local hop = require("hop")
      local directions = require("hop.hint").HintDirection

      hop.setup()
      vim.keymap.set({ "n", "o" }, "f", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end)
      vim.keymap.set({ "n", "o" }, "F", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end)
      vim.keymap.set({ "n", "o" }, "t", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end)
      vim.keymap.set({ "n", "o" }, "T", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end)
      vim.keymap.set("n", "s", function()
        hop.hint_words({ direction = directions.AFTER_CURSOR })
      end)
      vim.keymap.set("n", "S", function()
        hop.hint_words({ direction = directions.BEFORE_CURSOR })
      end)
    end,
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
