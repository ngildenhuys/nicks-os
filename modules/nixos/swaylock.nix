{config, ...}: {
  config = {
    # sway lock screen
    security.pam.services.swaylock = {};
    home-manager.users.${config.user}.programs.swaylock = {
      enable = true;
    };
  };
}
