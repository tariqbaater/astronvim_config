return {
  -- You can also add new plugins here as well:
  -- Add LazyVim and all your plugins
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
    "jesseleite/nvim-macroni",
  },
  {
    "deepskyblue86/bard-nvim",
    lazy = false,
    config = function()
      require("bard").setup { bardcli_path = "/opt/homebrew/bin/bard-cli", bardcli_config_path = "$HOME/.bardcli.yaml" }
    end,
  },
  {
    "diepm/vim-rest-console",
    lazy = false,
    -- config = function()
    --   require("rest-nvim").setup()
    -- end,
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
      -- { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
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
    opts = {
      -- add any options here
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
      },
    },
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
  {
    "lervag/vimtex",
    dependencies = {
      "micangl/cmp-vimtex",
    },
    version = "*",
    -- event = { "BufReadPre", "BufNewFile" },       -- WARNING: adding events can prevent synctex inverse search from working
    config = function()
      -- vim.g['vimtex_view_method'] = 'zathura'     -- main variant with xdotool (requires X11; not compatible with wayland)
      vim.g["vimtex_view_method"] = "zathura_simple" -- for variant without xdotool to avoid errors in wayland
      vim.g["vimtex_quickfix_mode"] = 0 -- suppress error reporting on save and build
      vim.g["vimtex_mappings_enabled"] = 0 -- Ignore mappings
      vim.g["vimtex_indent_enabled"] = 0 -- Auto Indent
      vim.g["tex_flavor"] = "latex" -- how to read tex files
      vim.g["tex_indent_items"] = 0 -- turn off enumerate indent
      vim.g["tex_indent_brace"] = 0 -- turn off brace indent
      vim.g["vimtex_syntax_enabled"] = 1 -- Syntax highlighting
      vim.g["vimtex_context_pdf_viewer"] = "okular" -- external PDF viewer run from vimtex menu command
      vim.g["vimtex_log_ignore"] = { -- Error suppression:
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
      }
    end,
  },
}
