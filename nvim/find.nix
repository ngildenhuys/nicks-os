{
  plugins = {
    fzf-lua = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          action = "files";
          options.desc = "Live fd";
        };
        "<leader>fw" = {
          action = "live_grep";
          options.desc = "Live Grep";
        };
        "<leader>gc" = {
          action = "git_commits";
          options.desc = "Git Commits";
        };
        "<leader>gs" = {
          action = "git_status";
          options.desc = "Git Status";
        };
        "<leader>fk" = {
          action = "keymaps";
          options.desc = "Key Maps";
        };
      };
    };

    # TODO : maybe get rid of this in favor of fzf lua
    # telescope = {
    #   enable = true;
    #   keymaps = {
    #     "<leader>ff" = {
    #       action = "find_files";
    #       options = {
    #         desc = "Telescope Find Files";
    #       };
    #     };
    #   };
    # };

    todo-comments = {
      enable = true;
    };
  };
}
