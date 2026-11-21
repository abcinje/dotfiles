vim.o.wrapscan = false

vim.keymap.set("n", ":", ";")
vim.keymap.set("n", ";", ":")

if vim.g.vscode then
  local vscode = require("vscode")
  vim.keymap.set("n", "<C-H>", function()
    vscode.action("workbench.action.navigateLeft")
  end)
  vim.keymap.set("n", "<C-J>", function()
    vscode.action("workbench.action.navigateDown")
  end)
  vim.keymap.set("n", "<C-K>", function()
    vscode.action("workbench.action.navigateUp")
  end)
  vim.keymap.set("n", "<C-L>", function()
    vscode.action("workbench.action.navigateRight")
  end)
else
  vim.o.ignorecase = true
  vim.o.linebreak = true
  vim.o.list = true
  vim.o.relativenumber = true
  vim.o.shiftwidth = 0
  vim.o.showcmd = false
  vim.o.showmode = false
  vim.o.smartcase = true
  vim.o.splitbelow = true
  vim.o.splitright = true
  vim.o.swapfile = false
  vim.o.termguicolors = true
  vim.o.whichwrap = "bs<>[]"

  vim.opt.clipboard = { "unnamed", "unnamedplus" }
  vim.opt.fillchars:append({ eob = " " })
  vim.opt.listchars:append({ tab = "» ", trail = "·" })
  vim.opt.shortmess:append("I")
  vim.opt.spelllang:append("cjk")

  vim.g.clipboard = "osc52"
  vim.g.mapleader = " "

  vim.keymap.set("i", "jk", "<Esc>")
  vim.keymap.set("n", "gj", "j")
  vim.keymap.set("n", "gk", "k")
  vim.keymap.set("n", "j", "gj")
  vim.keymap.set("n", "k", "gk")
  vim.keymap.set("n", "<C-H>", "<C-W>h")
  vim.keymap.set("n", "<C-J>", "<C-W>j")
  vim.keymap.set("n", "<C-K>", "<C-W>k")
  vim.keymap.set("n", "<C-L>", "<C-W>l")
  vim.keymap.set("n", "<Leader>h", "<Cmd>nohlsearch<CR>")

  local indent_styles = {
    { filetypes = { "c", "cpp" }, expandtab = false, tabstop = 8 },
    { filetypes = { "java", "python", "rust" }, expandtab = true, tabstop = 4 },
    { filetypes = { "lua", "sh" }, expandtab = true, tabstop = 2 },
  }
  for _, style in ipairs(indent_styles) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = style.filetypes,
      callback = function()
        vim.bo.expandtab = style.expandtab
        vim.bo.tabstop = style.tabstop
      end,
    })
  end

  vim.api.nvim_set_hl(0, "@lsp.type.comment.c", { link = "Normal" })
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      vim.api.nvim_set_hl(0, "@lsp.type.comment.c", { link = "Normal" })
    end,
  })

  vim.lsp.config("lua_ls", {
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            "vim",
          },
        },
      },
    },
  })

  require("plugins")
end
