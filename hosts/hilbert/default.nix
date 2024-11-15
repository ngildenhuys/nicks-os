{inputs, ...}:
with inputs;
  nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      home-manager.nixosModules.home-manager
      ../../modules/common
      ../../modules/nixos
      ./hardware.nix
      {
        # Operating system configuratoins
        user = "ngildenhuys";
        gitName = "Nicholas Gildenhuys";
        gitEmail = "nicholas@gildenhuys.net";

        gui.enable = true;

        # theme = {
        #   colors = (import ../../colorscheme/gruvbox-dark).dark;
        #   dark = true;
        # };

        # # wallpaper stuff
        # wallpaper = "${inputs.wallpapers}/gruvbox/road.jpg";
        # gtk.theme.name = inputs.nixpkgs.lib.mkDefault "Adwaita-dark";

        # Programs and services
        # neovim.enable = true;
        # firefox.enable = true;
        # kitty.enable = true;
        # discord.enable = true;
        # obsidian.enable = true;
        # rust.enable = true;

        # Services enables
      }
    ];
  }
