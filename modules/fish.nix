{programs, ...}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      cdr = "cd $(git rev-parse --show-toplevel)";
      ## Make vim just neovim
      vi = "nvim";
      vim = "nvim";
      vimdiff = "nvim -d";

      # use eza instead of ls
      ls = "eza";
      ll = "eza -la";
      l = "eza -la";

      # git related alias
      gs = "git status";
      gcam = "git commit -am";
      gd = "git diff";
      glr = "git log --raw";
      glg = "git log --pretty --all --graph --oneline";
      glrg = "git log --pretty --all --graph --raw";

      # cargo aliases
      cb = "cargo build";
      cr = "cargo run";
      ct = "cargo test";

      #justfile aliases
      jb = "just build";
      jr = "just run";
      jt = "just test";
      jl = "just lint";
    };
  };
}

