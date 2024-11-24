{...}: {
  config = {
    programs = {
      direnv = {
        enable = true;
        # These are defaulted to true anyways
        # enableBashIntegration = true; # see note on other shells below
        # enableFishIntegration = true;
        # enableZshIntegration = true;
        nix-direnv.enable = true;
      };
    };
  };
}
