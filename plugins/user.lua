return {
  {
    "jesseleite/nvim-macroni",
  },
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
    },
    -- If you have a recent version of lazy.nvim, you don't need to add this!
    build = "nvim -l build/init.lua",
    lazy = false,
  },
  {
    "tpope/vim-dadbod",
    lazy = false,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
      "DBRowsCount",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_row_count = 1
      vim.g.db_ui_row_count_format = " "
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    lazy = false,
  },
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
      ---@diagnostic disable-next-line: missing-fields
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
  -- {
  --   "Pocco81/auto-save.nvim",
  --   event = "User AstroFile",
  --   config = function()
  --     require("auto-save").setup {
  --       enabled = true,
  --       execution_message = {
  --         message = "Auto Save",
  --       },
  --     }
  --   end,
  -- },
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
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      -- configuration options...
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup {
        cmdline = {
          view = "cmdline_popup",
        },
        messages = {
          enabled = true,
          view = "mini",
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
        },
      }
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "easymotion/vim-easymotion",
    lazy = false,
  },
}
