vim.opt.clipboard = { "unnamed", "unnamedplus" }
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars:append({ tab = "» ", trail = "·" })
vim.opt.relativenumber = true
vim.opt.shortmess:append("I")
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.wrapscan = false

vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", ":", ";")
vim.keymap.set("n", ";", ":")
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
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup({ options = { show_buffer_icons = false } })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      vim.opt.signcolumn = "yes"
      require("gitsigns").setup()
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      vim.keymap.set("n", "<Leader>g", "<Cmd>LazyGit<CR>")
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

  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = "<C-\\>",
      shade_terminals = false,
    },
  },

  {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.opt.background = "light"
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("zenwritten")
    end,
    priority = 1000,
  },
})
