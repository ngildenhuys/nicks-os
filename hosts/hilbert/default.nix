{ inputs, ... }:
with inputs;
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    home-manager.nixosModules.home-manager
    ../../modules/common
    # ../../modules/nixos # TODO : nixos config
    {
      # Nick's Os Module Configuration 

      # Theming

      # Turn on all features related to desktop and graphical applications
      gui.enable = true;

      # Set the system-wide theme, also used for non-graphical programs
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

      # TODO : seperate the hardwre out to another file
      # import ./hardware/framework.nix;
  # imports =
  #   [ (modulesPath + "/installer/scan/not-detected.nix")
  #   ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/d0ece06e-de0a-456e-a639-6da09065f05a";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/424E-FC68";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = nixpkgs.lib.mkDefault true;
  # networking.interfaces.wlp166s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = nixpkgs.lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = nixpkgs.lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = nixpkgs.lib.mkDefault config.hardware.enableRedistributableFirmware;
    }
  ];
}
