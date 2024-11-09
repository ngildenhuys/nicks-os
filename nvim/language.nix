{
  plugins = {
    # completions
    # cmp-nvim-lsp.enable = true;
    # cmp-buffer.enable = true;
    # cmp-path.enable = true;
    friendly-snippets.enable = true;
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
        # snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = let
          selectOpts = "{behavior = cmp.SelectBehavior.Select}";
        in {
          "<Up>" = "cmp.mapping.select_prev_item(${selectOpts})";
          "<Down>" = "cmp.mapping.select_next_item(${selectOpts})";

          "<C-p>" = "cmp.mapping.select_prev_item(${selectOpts})";
          "<C-n>" = "cmp.mapping.select_next_item(${selectOpts})";

          "<C-u>" = "cmp.mapping.scroll_docs(-4)";
          "<C-d>" = "cmp.mapping.scroll_docs(4)";

          "<C-e>" = "cmp.mapping.abort()";
          "<C-y>" = "cmp.mapping.confirm({select = true})";
          "<CR>" = "cmp.mapping.confirm({select = false})";
          "<Tab>" = ''
            cmp.mapping(
              function(fallback)
                local col = vim.fn.col('.') - 1

                if cmp.visible() then
                  cmp.select_next_item(select_opts)
                elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                  fallback()
                else
                  cmp.complete()
                end
              end,
              { "i", "s" }
            )
          '';

          "<S-Tab>" = ''
            cmp.mapping(
              function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item(select_opts)
                else
                  fallback()
                end
              end,
              { "i", "s" }
            )
          '';
        };
        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
            zindex = 1001;
            scrolloff = 0;
            colOffset = 0;
            sidePadding = 1;
            scrollbar = true;
          };
          documentation = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
            zindex = 1001;
            maxHeight = 20;
          };
        };
      };
    };

    # cmp-treesitter.enable = true;
    # dap.enable = true;

    navic = {
      enable = true;
      settings.lsp.auto_attach = true;
    };

    none-ls = {
      enable = true;
      sources.formatting = {
        alejandra.enable = true;
        just.enable = true;
        prettier.enable = true;
        stylua.enable = true;
        yamlfmt.enable = true;
      };
      sources.diagnostics = {
        yamllint.enable = true;
      };
    };

    lsp = {
      enable = true;
      inlayHints = true;
      keymaps = {
        diagnostic = {
          "<leader>E" = "open_float";
          "[" = "goto_prev";
          "]" = "goto_next";
          "<leader>do" = "setloclist";
        };
        lspBuf = {
          "K" = "hover";
          "gD" = "declaration";
          "gd" = "definition";
          "gr" = "references";
          "gI" = "implementation";
          "gy" = "type_definition";
          "<leader>ca" = "code_action";
          "<leader>cr" = "rename";
          "<leader>wl" = "list_workspace_folders";
          "<leader>wr" = "remove_workspace_folder";
          "<leader>wa" = "add_workspace_folder";
        };
      };

      servers = {
        # jsonls.enable = true;
        # marksman.enable = true;
        # nil-ls.enable = true;
        # nixd.enable = true;
        yamlls.enable = true;
        taplo.enable = true;
      };
    };

    trouble = {
      enable = true;
      settings = {
        use_diagnostic_signs = true;
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          # lsp_fallback = "fallback";
          timeout_ms = 500;
        };
        notify_on_error = true;

        formatters_by_ft = {
          just = ["just"];
          lua = ["stylua"];
          markdown = ["prettier"];
          yaml = ["yamlfmt"];
        };
      };
    };
  };
}
