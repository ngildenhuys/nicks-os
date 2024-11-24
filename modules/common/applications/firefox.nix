{config, ...}: {
  config = {
    home-manager.users.${config.user}.programs.firefox = {
      enable = true;
    };
  };
}
