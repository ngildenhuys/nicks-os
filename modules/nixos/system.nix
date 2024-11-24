{
  pkgs,
  config,
  ...
}: {
  config = {
    users.users.${config.user} = {
      initialPassword = "";
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
    };

    # enable for wayland
    security.polkit.enable = true;

    # enable wayland sway window manager
    home-manager.users.${config.user}.wayland.windowManager.sway = {
      enable = true;
      config = {
        modifier = "Mod4";
        terminal = "alacritty";
      };
    };

    # login greeter
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
          user = "${config.user}";
        };
      };
    };

    # sway lock screen
    # security.pam.services.swaylock = {};
    # home-manager.users.${config.user}.programs.swaylock = {
    #   enable = true;
    # };
  };
}
