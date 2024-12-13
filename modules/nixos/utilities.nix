{
  config,
  pkgs,
  ...
}: {
  config = {
    home-manager.users.${config.user} = {
      home.packages = [
        (pkgs.writeShellApplication {
          name = "launch-finances";
          runtimeInputs = [pkgs.sway-new-workspace];
          text = ''
            sway-new-workspace open
            firefox --new-window https://www.wellsfargo.com/
          '';
        })
      ];
    };
  };
}
