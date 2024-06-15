return {
  -- neovim dev suggestions
  { "folke/neodev.nvim" }, -- don't know if it works

  -- Code to comments
  {
    'numToStr/Comment.nvim',
  }, -- works great
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.cmd.cprev()
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.cmd.cnext()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS)\s*:]], -- ripgrep regex
      }
    },
    config = true,
    -- stylua: ignore
    keys = {
      { "[t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "]t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
    },
  }, -- works great
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', opt = true },
      { "SmiteshP/nvim-navic" } },
    init = function()
      local navic = require("nvim-navic")
      require('lualine').setup({
        sections = {
          lualine_c = {
            {
              function()
                return navic.get_location()
              end,
              cond = function()
                return navic.is_available()
              end
            },
          }
        }
      }
      )
    end,
  }, -- works great
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  }, -- works fine

}
