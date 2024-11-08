
default:
  just --list

hostname := `hostname | cut -d "." -f 1`

# Build the nix-darwin system configuration without switching to it
[macos]
build target_host=hostname flags="":
  @echo "TODO : need to figure out build command"
  # nix --extra-experimental-features 'nix-command flakes'  build ".#darwinConfigurations.{{target_host}}" {{flags}}
  nix run nix-darwin -- build --flake .

# Build the nix-darwin config with the --show-trace flag set
[macos]
trace target_host=hostname: (build target_host "--show-trace")

# Build the nix-darwin configuration and switch to it
[macos]
switch target_host=hostname:
  @echo "switching to new config for {{target_host}}"
  nix run nix-darwin -- switch --flake .

# Reload the skhd (hotkey daemon) service to apply new config. Workaround for config changes not being auto-detected.
# [macos]
# reload-skhd:
#   launchctl stop org.nixos.skhd && launchctl start org.nixos.skhd && sleep 1 && skhd -r


# Build the NixOS configuration without switching to it
[linux]
build target_host=hostname flags="":
  nixos-rebuild build --flake .#{{target_host}} {{rebuild_flags}} {{flags}}

# Build the NixOS config with the --show-trace flag set
[linux]
trace target_host=hostname: (build target_host "--show-trace")

# Build the NixOS configuration and switch to it.
[linux]
switch target_host=hostname:
  sudo nixos-rebuild switch --flake .#{{target_host}} {{rebuild_flags}}

# Update flake inputs to their latest revisions
update:
  nix flake update

# Garbage collect old OS generations and remove stale packages from the nix store
gc generations="5d":
  sudo nix-env --delete-generations {{generations}}
  sudo nix-store --gc
