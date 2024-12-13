{
  pkgs,
  config,
  ...
}: {
  config = {
    home-manager.users.${config.user}.programs.alacritty = {
      enable = true;
      settings = {
        font.size = 9;
        colors.draw_bold_text_with_bright_colors = true;
        live_config_reload = true;
        shell.program = "${pkgs.fish}/bin/fish";
        window.option_as_alt = "Both";
      };
    };
  };
}
