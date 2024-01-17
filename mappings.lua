-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
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
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- run python file
    ["<leader>r"] = { ":w<CR>:sp |terminal python3 %<CR>i", desc = "Run Python File" },
        -- Run JS File
    ["<leader>j"] = { ":w<CR>:sp |terminal node %<CR>i", desc = "Run JS File" },

    ["<leader>i"] = { ":w<CR>:sp | terminal Rscript %<CR>", desc = "Run R File" },
    -- for saving
    ["<leader>s"] = { ":w<CR>", desc = "Save" },
    -- for formatting sql
    ["<leader>q"] = { ":%!sqlformat --reindent --keywords upper --identifiers lower - <CR>", desc = "Format SQL" },
    -- for deploying DBUI
    ["<leader>d"] = { ":DBUIToggle<CR>", desc = "Deploy DBUI" },

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
