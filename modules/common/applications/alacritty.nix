{pkgs, programs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      # font.normal.family = "MesloLGS Nerd Font Mono";
      font.normal.family = "JetBrainsMonoNL NFM";
      font.size = 16;
      colors.draw_bold_text_with_bright_colors = true;
      live_config_reload = true;
      shell.program = "${pkgs.fish}/bin/fish";
      window.option_as_alt = "Both";
    };
  };
}
