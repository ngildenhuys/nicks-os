{
  pkgs,
  config,
  ...
}: {
  config = {
    networking.networkmanager.enable = true;

    users.users.${config.user} = {
      initialPassword = "";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };

    # enable for wayland
    security.polkit.enable = true;

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
  };
}
