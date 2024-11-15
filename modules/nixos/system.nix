{config, ...}: {
  config = {
    users.users.${config.user} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
    };
  };
}
