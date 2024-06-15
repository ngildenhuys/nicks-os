{pkgs, programs, home, ...}: {
  home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor=true;
  };
}
