{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.mail.enable {
    home-manager.users.${config.user} = {
      accounts.email.accounts.home.thunderbird.enable = true;
      programs.thunderbird = {
        enable = true;
        profiles = {
          home.isDefault = true;
        };
      };
    };
  };
}
