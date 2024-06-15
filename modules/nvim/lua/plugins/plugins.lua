return {

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  -- searching
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- version = '0.1.6',
    dependencies = { {'nvim-lua/plenary.nvim'},
                     {'BurntSushi/ripgrep'},
                   }
  },

  -- file tree searching
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {'nvim-treesitter/playground'},


  --[[ -- tree panel
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }, ]]


}
