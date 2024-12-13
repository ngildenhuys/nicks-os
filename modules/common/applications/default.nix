{
  config,
  lib,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./discord.nix
  ];
  config = {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) config.unfreePackages;
  };
}
