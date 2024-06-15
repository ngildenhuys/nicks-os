return {
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
--   { "lukas-reineke/indent-blankline.nvim",
--   config = function()
--     require("indent_blankline").setup {
--       -- for example, context is off by default, use this to turn it on
--       show_current_context = true,
--       show_current_context_start = true,
--     }
--   end,
-- }, -- Works as desired
{'nvim-tree/nvim-web-devicons'}, -- use as default icons for things
{
  "SmiteshP/nvim-navic",
  lazy = true,
  dependencies = "neovim/nvim-lspconfig",
  init = function()
    vim.g.navic_silence = true
    require("utils").on_attach(function(client, buffer)
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, buffer)
      end
    end)
  end,
}, -- works now with lualine inteagration
{
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  },
  opts = {
    options = {
      mode = "tabs",
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
          s = s .. n .. sym
        end
        return s
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
},
{
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
             .,-:;//;:=,
          . :H@@@MM@M#H/.,+%;,
       ,/X+ +M@@M@MM%=,-%HMMM@X/,
     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-
    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.
  ,%MM@@MH ,@%=             .---=-=:=,.
  =@#@@@MX.,                -%HX$$%%%:;
 =-./@M@M$                   .;@MMMM@MM:
 X@/ -$MM/                    . +MM@@@M$
,@M@H: :@:                    . =X#@@@@-
,@@@MMX, .                    /H- ;@M@M=
.H@@@@M@+,                    %MM+..%#$.
 /MMMM@MMH/.                  XM@MH; =;
  /%+%$XHH@$=              , .H@@@@MX,
   .=--------.           -%H.,@@@@@MX,
   .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.
     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=
       =%@M@M#@$-.=$@MM@@@M; %M%=
         ,:+$+-,/H#MMMMMMM@= =,
               =++%%%%+/:-.
      ]]
--     local logo = [[
--            __               ______   ______                 __
--           |  \             /      \ /      \               |  \
--  __     __ \▓▓______ ____ |  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ______   ____| ▓▓ ______
-- |  \   /  \  \      \    \| ▓▓___\▓▓ ▓▓   \▓▓/      \ /      ▓▓/      \
--  \▓▓\ /  ▓▓ ▓▓ ▓▓▓▓▓▓\▓▓▓▓\\▓▓    \| ▓▓     |  ▓▓▓▓▓▓\  ▓▓▓▓▓▓▓  ▓▓▓▓▓▓\
--   \▓▓\  ▓▓| ▓▓ ▓▓ | ▓▓ | ▓▓_\▓▓▓▓▓▓\ ▓▓   __| ▓▓  | ▓▓ ▓▓  | ▓▓ ▓▓    ▓▓
--    \▓▓ ▓▓ | ▓▓ ▓▓ | ▓▓ | ▓▓  \__| ▓▓ ▓▓__/  \ ▓▓__/ ▓▓ ▓▓__| ▓▓ ▓▓▓▓▓▓▓▓
--     \▓▓▓  | ▓▓ ▓▓ | ▓▓ | ▓▓\▓▓    ▓▓\▓▓    ▓▓\▓▓    ▓▓\▓▓    ▓▓\▓▓     \
--      \▓    \▓▓\▓▓  \▓▓  \▓▓ \▓▓▓▓▓▓  \▓▓▓▓▓▓  \▓▓▓▓▓▓  \▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓
--
--      ]]

dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("w", " " .. " Find text", ":Telescope live_grep <CR>"),
  --dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]), -- TODO : look at using
  dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaButtons"
  button.opts.hl_shortcut = "AlphaShortcut"
end
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.opts.layout[1].val = 8
return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
