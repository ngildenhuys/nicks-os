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
          runtimeInputs = [pkgs.firefox];
          text = ''
            firefox --new-window https://www.wellsfargo.com/
          '';
        })
      ];
      xdg.desktopEntries.finances = {
        name = "finances";
        exec = "launch-finances";
      };
    };
  };
}
