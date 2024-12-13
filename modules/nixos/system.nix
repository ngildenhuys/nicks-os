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

    # some system packages
    home-manager.users.${config.user}.home.packages = with pkgs; [
      # pulse audio volume control used in waybar
      pavucontrol
      # bluetooth applet
      blueman
    ];

    # enable for wayland
    security.polkit.enable = true;

    # enable bluetooth
    services.blueman.enable = true;

    time.timeZone = "America/Los_Angeles";

    # login greeter
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = ''${pkgs.greetd.tuigreet}/bin/tuigreet --user-menu --time --greeting "Login to Nick's OS" --cmd sway'';
          user = "${config.user}";
        };
      };
    };
  };
}
