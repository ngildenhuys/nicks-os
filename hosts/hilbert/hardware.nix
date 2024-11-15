{
  pkgs,
  config,
  ...
}: {
  # TODO : seperate the hardwre out to another file
  # import ./hardware/framework.nix;
  # imports =
  #   [ (modulesPath + "/installer/scan/not-detected.nix")
  #   ];

  boot = {
    consoleLogLevel = 0;
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [];
    };
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/d0ece06e-de0a-456e-a639-6da09065f05a";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/424E-FC68";
    fsType = "vfat";
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = pkgs.lib.mkDefault true;
  # networking.interfaces.wlp166s0.useDHCP = lib.mkDefault true;

  # pkgs.hostPlatform = pkgs.lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = pkgs.lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = pkgs.lib.mkDefault config.hardware.enableRedistributableFirmware;
}
