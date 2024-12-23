{
  config,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  nixpkgs.config.allowUnfree = true;
  environment = {
    shells = with pkgs; [
      fish
      zsh
    ];
    systemPackages = with pkgs; [
      # home-manager
      fish
      coreutils
      darwin.libiconv
      arc-browser
      # libiconvReal
    ];
    # enableDarwinABICompat = false;
    systemPath = ["/opt/rivos/riscv-gnu-toolchain/bin" "$HOME/work/dv-release/spike/bin"];
    pathsToLink = ["/Applications"];
    loginShell = pkgs.fish;
  };
  # buildInputs = with pkgs; [ rustfmt clippy ] ++ lib.optional stdenv.isDarwin libiconv;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;
    settings = {
      extra-experimental-features = ["nix-command" "flakes"];
      experimental-features = "nix-command flakes";
    };
  };

  services.postgresql = {
    enable = true;
  };

  # Necessary for using flakes on this system.

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Homeberw options
  # homebrew = {
  #   enable = true;
  #   # global.brewfile = true; # has to deal with brew bundle [install] stuff
  #   masApps = {};
  #   casks = [];
  #   taps = [];
  #   brews = ["libiconv"];
  # };
}
