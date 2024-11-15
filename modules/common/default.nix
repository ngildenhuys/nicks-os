{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./applications
    # ./editors
    # ./programming
    ./shell
  ];

  options = {
    user = lib.mkOption {
      type = lib.types.str;
      description = "Primary user of the system";
    };
    fullName = lib.mkOption {
      type = lib.types.str;
      description = "Human readable name of the user";
    };
    userDirs = {
      # Required to prevent infinite recursion when referenced by himalaya
      download = lib.mkOption {
        type = lib.types.str;
        description = "XDG directory for downloads";
        default =
          if pkgs.stdenv.isDarwin
          then "$HOME/Downloads"
          else "$HOME/downloads";
      };
    };
    gui = {
      enable = lib.mkEnableOption {
        description = "Enable graphics.";
        default = true;
      };
    };
    theme = {
      colors = lib.mkOption {
        type = lib.types.attrs;
        description = "Base16 color scheme.";
        default = (import ../colorscheme/gruvbox).dark;
      };
      dark = lib.mkOption {
        type = lib.types.bool;
        description = "Enable dark mode.";
        default = true;
      };
    };
    homePath = lib.mkOption {
      type = lib.types.path;
      description = "Path of user's home directory.";
      default = builtins.toPath (
        if pkgs.stdenv.isDarwin
        then "/Users/${config.user}"
        else "/home/${config.user}"
      );
    };
    unfreePackages = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "List of unfree packages to allow.";
      default = [];
    };
    hostnames = {
      git = lib.mkOption {
        type = lib.types.str;
        description = "Hostname for git server (Gitea).";
      };
    };
  };

  config = let
    stateVersion = "23.05";
  in {
    # Basic common system packages for all devices
    environment.systemPackages = with pkgs; [
      git
      neovim
      wget
      curl
    ];

    # Use the system-level nixpkgs instead of Home Manager's
    home-manager.useGlobalPkgs = true;

    # Install packages to /etc/profiles instead of ~/.nix-profile, useful when
    # using multiple profiles for one user
    home-manager.useUserPackages = true;

    # Allow specified unfree packages (identified elsewhere)
    # Retrieves package object based on string name
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) config.unfreePackages;

    # Pin a state version to prevent warnings
    home-manager.users.${config.user}.home.stateVersion = stateVersion;
    home-manager.users.root.home.stateVersion = stateVersion;
  };
}
