{
  globals.mapleader = " ";

  plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        # Settings groups
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
        }
        # {
        #   __unkeyed-1 = "<leader><tab>";
        #   group = "Tabs";
        # }
        {
          __unkeyed-1 = "<leader>f";
          group = "Find";
        }
        {
          __unkeyed-1 = "<leader>q";
          group = "Quit / Session";
        }
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffer";
        }
        # {
        #   __unkeyed-1 = "<leader>d";
        #   group = "Debug";
        #   icon = "";
        # }
        {
          __unkeyed-1 = "<leader>c";
          group = "Code Actions";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>d/";
          group = "Search";
          icon = "";
        }

        # Keys with custom icons / labels
        {
          __unkeyed-1 = "<leader>ca";
          icon = "󱐋";
          desc = "Code Actions";
        }
        {
          __unkeyed-1 = "<leader>cr";
          icon = "󰑕";
          desc = "Rename";
        }
      ];
    };
  };

  keymaps = [
    # Normal mode
    # {
    #   mode = "i";
    #   key = "jk";
    #   action = "<CMD>noh<CR><ESC>";
    #   options.desc = "Normal mode and clear highlight";
    # }
    # {
    #   mode = "i";
    #   key = "<ESC>";
    #   action = "<CMD>noh<CR><ESC>";
    #   options.desc = "Normal mode and clear highlight";
    # }
    # {
    #   mode = "n";
    #   key = "<ESC>";
    #   action = "<CMD>noh<CR><ESC>";
    #   options.desc = "Normal mode and clear highlight";
    # }

    # FZF-Lua custom commands -- I want to limit to current directory
    {
      mode = "n";
      key = "<leader>ff";
      action = "<CMD>lua require('fzf-lua').files({ cwd = vim.loop.cwd() })<CR>";
      options.desc = "Find Files";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<CMD>lua require('fzf-lua').oldfiles({ cwd = vim.loop.cwd() })<CR>";
      options.desc = "Recent Files";
    }

    # Git
    {
      mode = "n";
      key = "<leader>gg";
      action = "<CMD>LazyGit<CR>";
      options.desc = "LazyGit";
    }

    # Navigation
    {
      mode = "n";
      key = "<leader>pv";
      action = "<CMD>Ex<CR>";
      options.desc = "Exit to netrw";
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<c-D>zz";
      options.desc = "jump down center";
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<c-u>zz";
      options.desc = "jump up center";
    }
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options.desc = "search down center";
    }
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options.desc = "search up center";
    }


  ];
}
