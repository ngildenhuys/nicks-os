{config, ...}: {
  # kanshi specifies display configurations
  home-manager.users.${config.user}.services.kanshi = {
    enable = true;
    systemdTarget = "sway-session.target";

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 0.75;
            status = "enable";
          }
        ];
      };

      home_office = {
        outputs = [
          {
            criteria = "Dell Inc. DELL S3422DWG JP05KK3";
            scale = 1.25;
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
      };
    };
  };
}
