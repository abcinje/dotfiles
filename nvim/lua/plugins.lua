-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
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
            map("n", "<Leader>gs", gitsigns.stage_hunk)
            map("n", "<Leader>gr", gitsigns.reset_hunk)
            map("v", "<Leader>gs", function()
              gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end)
            map("v", "<Leader>gr", function()
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
      opts = {
        ensure_installed = { "lua_ls", "rust_analyzer" },
      },
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
  },

  -- Check for plugin updates
  checker = { enabled = true },
})
