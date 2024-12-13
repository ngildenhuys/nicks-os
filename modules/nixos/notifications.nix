{
  config,
  pkgs,
  ...
}: {
  config = {
    # home-manager.users.${config.user}.services.dunst.enable = true;
    home-manager.users.${config.user} = {
      services.swaync = {
        enable = true;
        settings = {
          positionX = "right";
          positionY = "top";
          control-center-positionX = "none";
          control-center-positionY = "none";
          control-center-margin-top = 8;
          control-center-margin-bottom = 8;
          control-center-margin-right = 8;
          control-center-margin-left = 8;
          control-center-width = 500;
          control-center-height = 600;
          fit-to-screen = true;

          layer-shell = true;
          layer = "overlay";
          control-center-layer = "overlay";
          cssPriority = "user";
          notification-icon-size = 64;
          notification-body-image-height = 100;
          notification-body-image-width = 200;
          notification-inline-replies = true;
          timeout = 10;
          timeout-low = 5;
          timeout-critical = 0;
          notification-window-width = 500;
          keyboard-shortcuts = true;
          image-visibility = "always";
          transition-time = 200;
          hide-on-clear = true;
          hide-on-action = true;
          script-fail-notify = true;

          widgets = [
            "inhibitors"
            "dnd"
            "mpris"
            "notifications"
          ];
          widget-config = {
            inhibitors = {
              text = "Inhibitors";
              button-text = "Clear All";
              clear-all-button = true;
            };
            title = {
              text = "Notifications";
              clear-all-button = false;
              button-text = "Clear All";
            };
            dnd = {
              text = "Do Not Disturb";
            };
            label = {
              max-lines = 5;
              text = "Label Text";
            };
            mpris = {
              image-size = 96;
              blur = true;
            };
          };
        };
      };
      home.packages = with pkgs; [
        libnotify
      ];
    };
  };
}