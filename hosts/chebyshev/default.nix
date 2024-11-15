
#      "Nicholass-MacBook-Pro" = nix-darwin.lib.darwinSystem {
#         system = "aarch64-darwin";
#         modules = [
#           ./modules/darwin.nix
#           home-manager.darwinModules.home-manager {
#             home-manager = {
#               useGlobalPkgs = true;
#               useUserPackages = true;
#               users.ngildenhuys = import ./modules/home.nix;
#             };
#             users.users.ngildenhuys.home = "/Users/ngildenhuys";
#           }
#         ];
#         specialArgs = { inherit inputs; };
#       };
