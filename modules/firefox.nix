{pkgs, programs, inputs, ...}: {
    programs.firefox = {
      enable = true;
    # profiles.ngildenhuys = {
    #   extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    #     # ArcFox
    #     bitwarden
    #     # ublock-origin
    #   ];
    #   id = 0;
    #   name = "ngildenhuys";
    #   isDefault = true;
    # };
  };
}

