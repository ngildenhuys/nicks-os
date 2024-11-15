{inputs, user_config, overlays, ...}:

with inputs;

nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ../../modules/common
          ../../modules/darwin
          ../../modules/home
	  # TODO : ngildenhuys : figure out why the example repo does not need to to all this stuff
	  # and instead just lists the modules in home-manager
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
