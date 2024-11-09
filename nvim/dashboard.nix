{
  plugins = {
    alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 4;
        }
        {
          type = "text";
          val = [
            "                                          "
            "              .,-:;//;:=,                 "
            "           . :H@@@MM@M#H/.,+%;,           "
            "        ,/X+ +M@@M@MM%=,-%HMMM@X/,        "
            "      -+@MM; $M@@MH+-,;XMMMM@MMMM@+-      "
            "     ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.    "
            "   ,%MM@@MH ,@%=             .---=-=:=,.  "
            "   =@#@@@MX.,                -%HX$$%%%:;  "
            "  =-./@M@M$                   .;@MMMM@MM: "
            "  X@/ -$MM/                    . +MM@@@M$ "
            " ,@M@H: :@:                    . =X#@@@@- "
            " ,@@@MMX, .                    /H- ;@M@M= "
            " .H@@@@M@+,                    %MM+..%#$. "
            "  /MMMM@MMH/.                  XM@MH; =;  "
            "   /%+%$XHH@$=              , .H@@@@MX,   "
            "    .=--------.           -%H.,@@@@@MX,   "
            "    .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.    "
            "      =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=      "
            "        =%@M@M#@$-.=$@MM@@@M; %M%=        "
            "          ,:+$+-,/H#MMMMMMM@= =,          "
            "                =++%%%%+/:-.              "
            "                                          "
          ];
          opts = {
            position = "center";
            hl = "Type";
          };
        }
        {
          type = "padding";
          val = 4;
        }
        {
          type = "group";
          val = [
            {
              type = "button";
              val = "      Find File    ";
              on_press.__raw = "function() require('fzf-lua').files({ cwd = vim.loop.cwd() }) end";
              opts = {
                shortcut = "f";
                keymap = [
                  "n"
                  "f"
                  "<cmd>lua require('fzf-lua').files({ cwd = vim.loop.cwd() })<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "padding";
              val = 2;
            }
            {
              type = "button";
              val = "      New File    ";
              on_press.__raw = "function() vim.cmd[[ene]] end";
              opts = {
                shortcut = "n";
                keymap = [
                  "n"
                  "n"
                  "<cmd>ene<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "padding";
              val = 2;
            }
            {
              type = "button";
              val = "      Find Text    ";
              on_press.__raw = "function() require('fzf-lua').live_grep() end";
              opts = {
                shortcut = "w";
                keymap = [
                  "n"
                  "w"
                  "<cmd>lua require('fzf-lua').live_grep()<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "padding";
              val = 2;
            }
            {
              type = "button";
              val = "      Quit Neovim    ";
              on_press.__raw = "function() vim.cmd[[qa]] end";
              opts = {
                shortcut = "q";
                keymap = [
                  "n"
                  "q"
                  "<cmd>qa<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                position = "center";
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
          ];
        }
      ];
    };
  };
}
