{
  config,
  pkgs,
  ...
}: let
  fontName = "JetBrainsMono";
in {
  config = {
    fonts.packages = with pkgs; [
      jetbrains-mono
      (nerdfonts.override {fonts = [fontName];})
    ];
    fonts.fontconfig.defaultFonts.monospace = [fontName];

    home-manager.users.${config.user}.programs.tofi = {
      enable = true;
      settings = {
        font = fontName;
        outline-width = 2;
        border-width = 2;
      };
    };
  };
}
