{
  config,
  pkgs,
  ...
}: {
  config = {
    # sway lock screen
    security.pam.services.swaylock = {};
    home-manager.users.${config.user}.services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 180;
          command = "${pkgs.libnotify}/bin/notify-send 'Locking in 60 seconds' -t 5000";
        }

        {
          timeout = 240;
          command = "${pkgs.swaylock-effects}/bin/swaylock";
        }

        {
          timeout = 300;
          command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
          resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
        }

        {
          timeout = 360;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = "${pkgs.swaylock-effects}/bin/swaylock";
        }
      ];
    };
  };
}
