vim.opt.linebreak = true
vim.opt.relativenumber = true
vim.opt.title = false
vim.opt.wrap = true
vim.opt.wrapscan = false

vim.keymap.set("i", "jk", "<Esc>")

lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      local hop = require("hop")
      local directions = require("hop.hint").HintDirection

      hop.setup()
      vim.keymap.set("n", "f", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end)
      vim.keymap.set("n", "F", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end)
      vim.keymap.set("n", "t", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end)
      vim.keymap.set("n", "T", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })
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
