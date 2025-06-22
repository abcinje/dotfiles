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
  vim.o.showcmd = false
  vim.o.showmode = false
  vim.o.smartcase = true
  vim.o.splitbelow = true
  vim.o.splitright = true
  vim.o.swapfile = false

  vim.opt.clipboard = { "unnamed", "unnamedplus" }
  vim.opt.fillchars:append({ eob = " " })
  vim.opt.listchars:append({ tab = "» ", trail = "·" })
  vim.opt.shortmess:append("I")

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

  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({
    {
      "numToStr/Comment.nvim",
      config = true,
    },

    {
      "uloco/bluloco.nvim",
      dependencies = "rktjmp/lush.nvim",
      config = function()
        vim.o.termguicolors = true
        vim.cmd.colorscheme("bluloco")
      end,
      priority = 1000,
    },

    {
      "akinsho/bufferline.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        vim.o.termguicolors = true
        require("bufferline").setup({ options = { show_buffer_icons = false } })
      end,
    },

    {
      "github/copilot.vim",
    },

    {
      "lewis6991/gitsigns.nvim",
      config = function()
        vim.o.signcolumn = "yes"
        local gitsigns = require("gitsigns")
        gitsigns.setup({
          on_attach = function(bufnr)
            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end
            map("n", "<Leader>hs", gitsigns.stage_hunk)
            map("n", "<Leader>hr", gitsigns.reset_hunk)
            map("v", "<Leader>hs", function()
              gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end)
            map("v", "<Leader>hr", function()
              gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end)
          end
        })
      end,
    },

    {
      "ggandor/leap.nvim",
      config = function()
        require("leap").add_default_mappings()
      end,
    },

    {
      "nvim-lualine/lualine.nvim",
      opts = {
        options = {
          component_separators = "│",
          section_separators = "",
          globalstatus = true,
        },
        sections = {
          lualine_c = {
            {
              "filename",
              path = 3,
            },
          },
        },
      },
    },

    {
      "williamboman/mason.nvim",
      config = true,
    },

    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
      config = function()
        require("mason-lspconfig").setup({ automatic_installation = true })
        require("lspconfig").lua_ls.setup({
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
        require("lspconfig").rust_analyzer.setup({})
      end,
    },

    {
      "windwp/nvim-autopairs",
      config = true,
    },

    {
      "ethanholz/nvim-lastplace",
      config = true,
    },

    {
      "dstein64/nvim-scrollview",
    },

    {
      "nvim-tree/nvim-tree.lua",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.o.termguicolors = true
        require("nvim-tree").setup()
        vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>")
      end,
    },

    {
      "nvim-telescope/telescope.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<Leader>f", function()
          local opts = { previewer = false }
          if not pcall(builtin.git_files, opts) then
            builtin.find_files(opts)
          end
        end)
        vim.keymap.set("n", "<Leader>t", function()
          local git_root = vim.fn.system("git rev-parse --show-toplevel")
          if vim.v.shell_error == 0 then
            builtin.live_grep({ cwd = vim.trim(git_root) })
          else
            builtin.live_grep()
          end
        end)
        vim.keymap.set("n", "<Leader>r", function()
          builtin.oldfiles({ previewer = false })
        end)
      end,
    },

    --[[
    {
      "mcchrish/zenbones.nvim",
      dependencies = "rktjmp/lush.nvim",
      config = function()
        vim.o.background = "light"
        vim.o.termguicolors = true
        vim.cmd.colorscheme("zenwritten")
      end,
      priority = 1000,
    },
    --]]
  })
end
