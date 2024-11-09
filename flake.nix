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
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nurpkgs.url = "github:nix-community/NUR";
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    nixpkgs,
    nix-darwin,
    home-manager,
    lix-module,
    flake-utils,
    nixvim,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        nixvim' = nixvim.legacyPackages.${system};
        baseNixvimModule = {
          # inherit nixpkgs;
          module = {pkgs, ...}: {
            imports = [
              ./nvim
            ];
          };
        };
      in {
        # would put the nixos configuiration here for NixOs System

        nixpkgs.config.allowUnfree = true;
        nixpkgs.overlays = [inputs.nurpkgs.overlay];

        # Nick's Vim configuration
        packages.nvim = nixvim'.makeNixvimWithModule baseNixvimModule;

        darwinConfigurations = {
          "Nicholass-MacBook-Pro" = nix-darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            modules = [
              lix-module.nixosModules.default
              ./modules/darwin.nix
              home-manager.darwinModules.home-manager
              {
                home-manager = {
                  extraSpecialArgs = {inherit inputs;};
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.ngildenhuys = import ./modules/home.nix;
                };
                users.users.ngildenhuys.home = "/Users/ngildenhuys";
              }
            ];
            specialArgs = {inherit inputs;};
          };
        };
      }
    );
}
