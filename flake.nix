{
  description = "Nick's OS Flake Configuration";

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
    self,
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
        nvim = nixvim'.makeNixvimWithModule baseNixvimModule;
      in {
        # would put the nixos configuiration here for NixOs System

        nixpkgs.config.allowUnfree = true;
        nixpkgs.overlays = [inputs.nurpkgs.overlay];

        # Nick's Vim configuration
        packages.nvim = nvim;
        packages.default = self.packages.${system}.nvim;

    	nixosConfigurations = {
    		hilbert = import ./hosts/hilbert {inherit inputs;};
    	#   # charles = import ./hosts/charles{inherit inputs globals;

    	#   # FIXME : replace with your hostname
    	#   hilbert = nixpkgs.lib.nixosSystem {
    	#     specialArgs = {inherit inputs outputs;};
    	#     modules = [
    	#       # > Our main nixos configuration file <
    	#       ./hosts/hilbert.nix
    	#       ./greetd.nix
    	#       home-manager.nixosModules.home-manager
    	#       {
    	#         home-manager.useGlobalPkgs = true;
    	#         home-manager.useUserPackages = true;

    	#         # TODO replace ryan with your own username
    	#         home-manager.users.ngildenhuys = import ./home-manager/home.nix;

    	#         # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
    	#       }
    	#     ];
    	#   };
    	};

        packages.darwinConfigurations = {
          "Nicholass-MacBook-Pro" = nix-darwin.lib.darwinSystem rec {
            system = "aarch64-darwin";
            modules = [
              {
                environment.systemPackages = [self.packages.${system}.nvim];
              }

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
