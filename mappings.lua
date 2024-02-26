-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local map = vim.api.nvim_set_keymap
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    -- change next buffer with tab
    map("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" }),
    -- change previous buffer with shift + tab
    map("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" }),

    ["<leader>b"] = { name = "Buffers" },
    -- run python file
    -- ["<leader>r"] = { ":w<CR>:sp |terminal python3 %<CR>i", desc = "Run Python File" },
    map(
      "n",
      "<leader>r",
      ":w<CR>:sp |terminal python3 %<CR>i",
      { noremap = true, silent = true, desc = "Run Python File" }
    ),
    -- Run JS File
    map("n", "<leader>j", ":w<CR>:sp |terminal node %<CR>i", { noremap = true, silent = true, desc = "Run JS File" }),
    -- Compile c++
    map(
      "n",
      "<leader>D",
      ":w<CR>:sp |terminal g++ % -o %:r && ./%:r<CR>i",
      { noremap = true, silent = true, desc = "Compile C++ File" }
    ),
    -- Compile typescript File
    map("n", "<leader>k", ":w<CR>:sp |terminal tsc <CR>i", { noremap = true, silent = true, desc = "Compile TS File" }),
    -- Run R File
    map(
      "n",
      "<leader>i",
      ":w<CR>:sp | terminal Rscript %<CR>i",
      { noremap = true, silent = true, desc = "Run R File" }
    ),
    -- for saving
    map("n", "<leader>s", ":w<CR>", { noremap = true, silent = true, desc = "Save File" }),
    -- for formatting sql
    map(
      "n",
      "<leader>q",
      ":%!sqlformat --reindent --keywords upper --identifiers lower - <CR>",
      { noremap = true, silent = true, desc = "Format SQL" }
    ),
    -- for deploying DBUI
    map("n", "<leader>W", ":DBUIToggle<CR>", { noremap = true, silent = true, desc = "Deploy DBUI" }),
    -- -- binding for macro
    -- ["<leader>T"] = { "^f,<t_˝a>a<BS><CR>jk@q", desc = "Unlisting Macro" },
    -- ["<leader>L"] = { "A,<Space>jkJ@W", desc = "Listing Macro" },
    -- keep the cursor in place while joining lines
    ["J"] = { "mzJ`z", desc = "Keep cursor in place while joining lines" },
    -- edit alternate file
    ["<leader>a"] = { "<C-^>", desc = "Edit alternate file" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  x = {
    -- move selected line
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line up" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line down" },
    -- escape visual mode
    ["kk"] = { "<esc>", desc = "Escape visual mode" },
  },
}
