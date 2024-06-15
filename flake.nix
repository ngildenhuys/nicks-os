{
  description = "Nick's Os Flake Configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nix-darwin, home-manager, ... }: {
    # would put the nixos configuiration here for NixOs System
    darwinConfigurations = {
      "Nicholass-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./modules/darwin.nix
          home-manager.darwinModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.ngildenhuys = import ./modules/home.nix;
            };
            users.users.ngildenhuys.home = "/Users/ngildenhuys";
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
