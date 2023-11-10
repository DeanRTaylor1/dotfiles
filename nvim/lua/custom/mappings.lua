local M = {}

-- Custom mappings
M.custom_mappings = {
  n = {
    ["<leader>pf"] = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find files" },
    ["<C-p>"] = { "<cmd>lua require('telescope.builtin').git_files()<CR>", "Git files" },
    -- ["<leader>ps"] = {
    --   function()
    --     require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
    --   end,
    --   "Grep string"
    -- },
    ["<leader>pv"] = { "<cmd>Ex<CR>", "Ex" },
    ["<leader>dd"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostic float" },
    ["<leader>ss"] = { "<cmd>w<CR>", "Save file", opts = { noremap = true } },
    ["<leader>tt"] = { "<cmd>terminal<CR>", "Open terminal", opts = { noremap = true } },
    ["<leader>ll"] = { ":set list<CR>", "Set list", opts = { noremap = true } },
    ["<leader>sp"] = { ":vsplit<CR>", "Split window", opts = { noremap = true} },
    ["<leader>gr"] = { ":Telescope lsp_references<CR>", "Find references", opts = { noremap = true } },

    ["<leader>ds"] = { ":Telescope lsp_document_symbols<CR>", "Document symbols", opts = { noremap = true} },
    ["<leader>de"] = { ":Telescope diagnostics<CR>", "Find Buffer Diagnostics", opts = { noremap = true } },
    
    -- copy current file path
    ["<leader>cd"] = { ':let @* = fnamemodify(expand("%"), ":~:.")<CR>', "Copy Current File Path", opts = { noremap = true } },



  }
}

return M
