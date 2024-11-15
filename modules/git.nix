{
  pkgs,
  programs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "ngildenhuys";
    userEmail = "ngildenhuys@rivosinc.com";
  };
}
