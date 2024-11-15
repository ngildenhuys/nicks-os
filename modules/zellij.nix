{
  pkgs,
  programs,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "Catppuccin Mocha";
      default_layout = "compact";
      default_shell = "fish";
    };
  };
}
