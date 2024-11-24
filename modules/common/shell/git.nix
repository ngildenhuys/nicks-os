{
  config,
  lib,
  ...
}: {
  options = {
    gitName = lib.mkOption {
      type = lib.types.str;
      description = "Name to use for git commits";
    };
    gitEmail = lib.mkOption {
      type = lib.types.str;
      description = "Email to use for git commits";
    };
  };

  config = {
    home-manager.users.root.programs.git = {
      enable = true;
    };

    home-manager.users.${config.user} = {
      programs.git = {
        enable = true;
        userName = config.gitName;
        userEmail = config.gitEmail;
      };

      programs.fish.shellAbbrs = {
        g = "git";
        gs = "git status";
        gd = "git diff";
        gds = "git diff --staged";
        gdp = "git diff HEAD^";
        ga = "git add";
        gaa = "git add -A";
        gac = "git commit -am";
        gc = "git commit -m";
        gca = "git commit --amend --no-edit";
        gcae = "git commit --amend";
        gu = "git pull";
        gp = "git push";
        gl = "git log --graph --decorate --oneline -20";
        gll = "git log --graph --decorate --oneline";
        glg = "git log --pretty --all --graph --oneline";
        glrg = "git log --pretty --all --graph --raw";
        gco = "git checkout";
        gcom = ''git switch (git symbolic-ref refs/remotes/origin/HEAD | cut -d"/" -f4)'';
        gcob = "git switch -c";
        gb = "git branch";
        gpd = "git push origin -d";
        gbd = "git branch -d";
        gbD = "git branch -D";
        gr = "git reset";
        grh = "git reset --hard";
        gm = "git merge";
        gcp = "git cherry-pick";
        cdr = "cd (git rev-parse --show-toplevel)";
      };
    };
  };
}
