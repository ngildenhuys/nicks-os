{
  inputs,
  myvim,
  ...
}:
with inputs;
  nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      nixos-hardware.nixosModules.framework-12th-gen-intel
      home-manager.nixosModules.home-manager
      {
        environment.systemPackages = [myvim];
      }
      ../../modules/nixos
      ../../modules/common
      ./hardware.nix
      rec {
        # Operating system configuratoins
        fullName = "Nicholas Gildenhuys";
        user = "ngildenhuys";
        gitName = fullName;
        gitEmail = "${mail.user}.@${mail.server}";

        gui.enable = true;

        # Programs and services
        # neovim.enable = true;
        # firefox.enable = true;
        # kitty.enable = true;
        discord.enable = true;
        # obsidian.enable = true;
        # rust.enable = true;
        mail = {
          enable = false;
          user = "nicholas";
          server = "gildenhuys.net";
          imapHost = "outlook.office365.com";
          smtpHost = "smtp.office365.com";
        };
        gaming.steam.enable = true;
      }
    ];
  }
