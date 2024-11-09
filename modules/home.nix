{pkgs, ...}: {
  imports = [
    ./neovim.nix
    ./alacritty.nix
    ./fish.nix
    ./git.nix
    ./direnv.nix
    ./zellij.nix
    # ./firefox.nix
  ];

  home = {
    # Don't change this when you change package input. Leave it alone.
    stateVersion = "23.11";

    # The home.packages option allows you to install Nix packages into your
    # environment.
    # sessionVariables.EDITOR = "nvim"
    packages = with pkgs; [
      my_nvim
      meson
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
      rustup
      cargo-modules
      # rustc
      eza
      poetry
      zellij
      pre-commit
      asciidoctor
      bazel
      libiconv
      iconv
      # libiconvReal
      # clang
      gnuplot
      verilator
      critcmp
      yq-go
      jq
      fastfetch
      nvd
      convco
      protobuf
      temporal-cli
      glow
      drawio
      antora
      mosh
      lazygit
      git-absorb
      cargo-udeps
      cargo-machete
      (python311.withPackages (ppkgs: (with ppkgs; [
        python-lsp-server
        python-lsp-ruff
        pytest
        pre-commit
        GitPython
        # work related imports
        jinja2
      ])))
    ];
  };
}
