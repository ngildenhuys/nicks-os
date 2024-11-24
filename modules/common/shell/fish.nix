{
  config,
  pkgs,
  ...
}: {
  users.users.${config.user}.shell = pkgs.fish;
  programs.fish.enable = true; # Needed for LightDM to remember username

  home-manager.users.${config.user} = {
    # Packages used in abbreviations and aliases
    home.packages = with pkgs; [curl];

    programs.fish = {
      enable = true;
      shellAliases = {
        # Use eza (exa) instead of ls for fancier output
        ls = "${pkgs.eza}/bin/eza --group";

        # Use nvim over all vi alternates
        vi = "vim";
        vim = "nvim";
        vimdiff = "nvim -d";
      };
      functions = {
      };

      loginShellInit = "";
      shellAbbrs = {
        # use eza instead of ls
        ll = "ls -la";
        l = "ls -la";

        # cargo aliases
        cb = "cargo build";
        cr = "cargo run";
        ct = "cargo test";

        #justfile aliases
        jb = "just build";
        jr = "just run";
        jt = "just test";
        jl = "just lint";

        # Fun CLI Tools
        weather = "curl wttr.in/$WEATHER_CITY";
        moon = "curl wttr.in/Moon";
      };
      shellInit = "";
    };

    home.sessionVariables.fish_greeting = "";

    # programs.starship.enableFishIntegration = true;
    # programs.zoxide.enableFishIntegration = true;
    # programs.fzf.enableFishIntegration = true;
  };
}
