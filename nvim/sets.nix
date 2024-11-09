{
  plugins = {
    indent-blankline.enable = true;
    tmux-navigator.enable = true;
    # one day we may move to zellij
    # zellij = {
    #   enable = true;
    #   settings = {
    #     replaceVimWindowNavigationKeybinds = true;
    #     vimTmuxNavigatorKeybinds = false;
    #   };
    # };

    bufferline = {
      # TODO: remove this once you are used to not having it
      enable = true;
      settings = {
        options = {
          mode = "tabs";
          always_show_bufferline = true;
          buffer_close_icon = "x";
          # buffer_close_icon = "";
          diagnostics = "nvim_lsp";
        };
      };
    };
    gitsigns = {
      enable = true;
      # settings = {
      #   current_line_blame = true;
      #   current_line_blame_opts = {
      #     virt_text = true;
      #     virt_text_pos = "eol";
      #   };
      #   signcolumn = true;
      #   signs = {
      #     add = {text = "│";};
      #     change = {text = "│";};
      #     changedelete = {text = "~";};
      #     delete = {text = "_";};
      #     topdelete = {text = "‾";};
      #     untracked = {text = "┆";};
      #   };
      #   watch_gitdir = {follow_files = true;};
      # };
    };

    lazygit.enable = true;

    lualine = {
      enable = true;
      settings = {
        options.globalstatus = true;
        sections = {
          lualine_c = [
            "navic"
          ];
        };
      };
    };

    luasnip.enable = true;

    mini = {
      enable = true;
      modules = {
        pairs = {};
      };
    };

    # noice.enable = true;
    # notify.enable = true;
    # nvim-autopairs.enable = true;
    nvim-colorizer.enable = true;

    render-markdown.enable = true;
    todo-comments.enable = true;

    # treesitter-context.enable = true; # mor in the way than anything
    treesitter = {
      enable = true;
      folding = false;
      settings.indent.enable = true;
    };

    # vim-surround.enable = true;
    web-devicons.enable = true;
  };
}
