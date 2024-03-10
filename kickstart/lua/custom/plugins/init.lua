-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {}
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  'nvim-treesitter/playground',
  {
    'jose-elias-alvarez/null-ls.nvim',
    ft = { 'go', 'typescript', 'lua' },
    opts = function()
      return require 'custom.plugins.configs.null-ls'
    end,
  },
}
