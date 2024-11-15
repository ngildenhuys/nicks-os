# Home Modules

These are modules that are managed by and passed to home-manager. So think shell environment, editors,
browsers, mail clients, etc...

These modules should all have a template looking something similar to this:
and the

```nix
{ config, pkgs, lib, ... }: {

  options = {
    <name-of-application> = {
      enable = lib.mkEnableOption {
        description = "Enable <name-of-application>.";
        default = false;
      };
    };
  };

  config = lib.mkIf (config.gui.enable && config.<name-of-applcation>.enable) {
    unfreePackages = [ "<name-of-applcation>" ];
    home-manager.users.${config.user} = {
    .
    .
    .
    };
  };
}
```
