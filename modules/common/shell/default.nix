{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./fish.nix
    ./git.nix
    ./direnv.nix
  ];
  config = {
    home-manager.users.${config.user} = {
      home = {
        sessionVariables.EDITOR = "nvim";
        packages = with pkgs; [
          htop
          ripgrep
          fd
          sd

          bat
          tree
          curl
          less
          just
          alacritty
          coreutils
          rustup

          eza
          poetry
          zellij
          pre-commit
          asciidoctor

          gnuplot

          jq
          fastfetch
          nvd
          convco

          glow
          mosh
          lazygit

          git-absorb
        ];
      };
    };
  };
}
