return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "Exafunction/codeium.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<Tab>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<A-c>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<A-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
    end,
    event = "User AstroFile",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "justinmk/vim-sneak",
    event = "User AstroFile",
  },
  {
    "mg979/vim-visual-multi",
    event = "User AstroFile",
  },
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        --  or leave it empty to use the default settings
        --  (https://github.com/folke/todo-comments.nvim/blob/main/doc/todo-comments.txt)
        keywords = {
          Youtube = { icon = "", color = "#ff5555" },
          Github = { icon = "", color = "#0000ff" },
          Gitlab = { icon = "", color = "#50fa7b" },
          URL = { icon = "", color = "#7711ff" },
        },
      }
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/snippets" } } -- load snippets paths
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "User AstroFile",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "User AstroFile",
  },
  {
    "Pocco81/auto-save.nvim",
    event = "User AstroFile",
    config = function()
      require("auto-save").setup {
        enabled = true,
        execution_message = {
          message = "Auto Save",
        },
      }
    end,
  },
  {
    "mattn/emmet-vim",
    event = "User AstroFile",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    config = true,
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      {
        "<leader>vs",
        "<cmd>:VenvSelect<cr>",
        -- key mapping for directly retrieve from cache. You may set autocmd if you prefer the no hand approach
        "<leader>vs",
        "<cmd>:VenvSelectCached<cr>",
      },
    },
  },
}
