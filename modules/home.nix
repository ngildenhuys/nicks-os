{ config, pkgs, lib, ... }:

{
  imports = [
    ./neovim.nix
    ./alacritty.nix
    ./fish.nix
    ./git.nix
    ./direnv.nix
  ];

  home = {
    # Don't change this when you change package input. Leave it alone.
    stateVersion = "23.11";

    # The home.packages option allows you to install Nix packages into your
    # environment.
    # sessionVariables.EDITOR = "nvim"
    packages = with pkgs; [
      ripgrep
      fd
      sd
      # git
      bat
      tree
      curl
      less
      just
      alacritty
      coreutils
      cargo
      eza
      poetry
      zellij
      pre-commit
      asciidoctor
      bazel
      # clang
      gnuplot
      verilator
      critcmp
      yq-go
      fastfetch
      (python311.withPackages (ppkgs: (with ppkgs; [
        python-lsp-server
        python-lsp-ruff
        pytest
        pre-commit
      ])))
    ];
  };
}


