{config, ...}: {
  config = {
    home-manager.users.${config.user}.programs.rofi = {
      enable = true;
    };
  };
}
