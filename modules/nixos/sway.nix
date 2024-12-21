{
  config,
  pkgs,
  ...
}: {
  config = {
    # enable wayland sway window manager
    home-manager.users.${config.user}.wayland.windowManager.sway = rec {
      enable = true;
      config = {
        modifier = "Mod4";
        terminal = "alacritty";
        # menu = "rofi -show ";
        # file = "rofi";

        left = "h";
        down = "j";
        up = "k";
        right = "l";

        menu = let
          font-arg = "--font ${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
        in
          # "tofi-run ${font-arg} | xargs swaymsg exec --";
          "tofi-run ${font-arg} | xargs swaymsg exec --";
        # "tofi-drun --drun-launch=true ${font-arg}";

        # file = "rofi -show filebrowser | swaymsg";
        # power = "rofi -show powermenu | swaymsg";
        # browser = "firefox";
        # private-browser = "firefox --private-window";
        gaps.smartBorders = "on";
        bars = [
          {
            command = "waybar";
          }
        ];
      };

      extraConfig = ''
        default_border pixel 4
        bindsym ${config.modifier}+Shift+d "tofi-drun --font ${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf | xargs swaymsg exec --"
        bindsym ${config.modifier}+tab workspace next_on_output
        bindsym ${config.modifier}+Shift+tab workspace prev_on_output
      '';
      # bindsym ${config.modifier}+space exec $menu
    };
  };
  #
  # input {
  #   type:touchpad {
  #     tap enabled
  #     natural_scroll enabled
  #     middle_emulation enabled
  #     dwt disabled
  #   }
  #
  #   type:keyboard {
  #     xkb_options ctrl:nocaps
  #   }
  #
  #   type:touch {
  #     events disabled
  #   }
  # }
  #
  # #
  # # Load Xresources
  # #
  # exec_always xrdb -load ~/.Xresources
  #
  # ### Key bindings
  # #
  # # Basics:
  # #
  # bindsym {
  #   $mod+Return exec $term
  #   $mod+w kill
  #   $mod+Shift+Return exec $menu
  #   $mod+b exec $browser
  #   $mod+Shift+b exec $private-browser
  #   $mod+e exec $file
  #   $mod+q exec $power
  #   $mod+z exec swaylock
  #   $mod+Shift+c reload
  # }
  #
  # #
  # # Multimedia:
  # #
  # bindsym --locked {
  #   XF86MonBrightnessUp exec light -A 5
  #   XF86MonBrightnessDown exec light -U 5
  #
  #   XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
  #   XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
  #   XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
  #   XF86AudioMicMute exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
  #
  #   XF86AudioPlay exec playerctl play-pause
  #   XF86AudioNext exec playerctl next
  #   XF86AudioPrev exec playerctl previous
  #
  #   $mod+p exec playerctl play-pause
  #   $mod+Period exec playerctl next
  #   $mod+Comma exec playerctl previous
  # }
  #
  # # Drag floating windows by holding down $mod and left mouse button.
  # # Resize them with right mouse button + $mod.
  # # Despite the name, also works for non-floating windows.
  # # Change normal to inverse to use left mouse button for resizing and right
  # # mouse button for dragging.
  # floating_modifier $mod normal
  #
  # #
  # # Window controls:
  # #
  # bindsym {
  #   # Change focus
  #   $mod+$left focus left
  #   $mod+$down focus down
  #   $mod+$up focus up
  #   $mod+$right focus right
  #
  #   # Move
  #   $mod+Shift+$left move left
  #   $mod+Shift+$down move down
  #   $mod+Shift+$up move up
  #   $mod+Shift+$right move right
  #
  #   # Resize
  #   $mod+Ctrl+$left resize shrink width $resize_factor
  #   $mod+Ctrl+$down resize grow height $resize_factor
  #   $mod+Ctrl+$up resize shrink height $resize_factor
  #   $mod+Ctrl+$right resize grow width $resize_factor
  # }
  #
  # #
  # # Workspaces:
  # #
  # bindsym {
  #   # Switch to workspace
  #   $mod+1 workspace number 1
  #   $mod+2 workspace number 2
  #   $mod+3 workspace number 3
  #   $mod+4 workspace number 4
  #   $mod+5 workspace number 5
  #   $mod+6 workspace number 6
  #   $mod+7 workspace number 7
  #   $mod+8 workspace number 8
  #   $mod+9 workspace number 9
  #   $mod+0 workspace number 10
  #
  #   # Move focused container to workspace
  #   $mod+Shift+1 move container to workspace number 1
  #   $mod+Shift+2 move container to workspace number 2
  #   $mod+Shift+3 move container to workspace number 3
  #   $mod+Shift+4 move container to workspace number 4
  #   $mod+Shift+5 move container to workspace number 5
  #   $mod+Shift+6 move container to workspace number 6
  #   $mod+Shift+7 move container to workspace number 7
  #   $mod+Shift+8 move container to workspace number 8
  #   $mod+Shift+9 move container to workspace number 9
  #   $mod+Shift+0 move container to workspace number 10
  # }
  #
  # #
  # # Layout stuff:
  # #
  # bindsym {
  #   # Make the current focus fullscreen
  #   $mod+f fullscreen
  #
  #   # Toggle the current focus between tiling and floating mode
  #   $mod+Shift+space floating toggle
  #
  #   # Swap focus between the tiling area and the floating area
  #   $mod+space focus mode_toggle
  #
  #   # Move focus to the parent container
  #   $mod+a focus parent
  #
  #   # Move the currently focused window to the scratchpad
  #   $mod+Shift+minus move scratchpad
  #
  #   # Show the next scratchpad window or hide the focused scratchpad window.
  #   # If there are multiple scratchpad windows, this command cycles through them.
  #   $mod+minus scratchpad show
  # }
  #
  # #
  # ### Screenshot mode:
  # #
  # set {
  #   $screenshot "Screenshot: [s]creen [w]window [r]egion"
  #
  #   $screenshot-cmd ~/.config/sway/screenshot.sh
  # }
  #
  # mode $screenshot {
  #   bindsym --to-code {
  #     s mode "default", exec $screenshot-cmd screen
  #     w mode "default", exec $screenshot-cmd window
  #     r mode "default", exec $screenshot-cmd region
  #
  #     Return mode "default"
  #     Escape mode "default"
  #     $mod+x mode "default"
  #   }
  # }
  #
  # bindsym --to-code $mod+s mode $screenshot
  #
  # ### Theming
  # #
  # # Colors:
  # #
  # set {
  #   $accent #ebdbb2
  #   $red #cc241d
  #   $darkgray #3c3836
  # }
  #
  # client.focused          $accent $accent $darkgray $accent $accent
  # client.focused_inactive $darkgray $darkgray $accent $darkgray $darkgray
  # client.unfocused        $darkgray $darkgray $accent $darkgray $darkgray
  # client.urgent           $red $red $accent $red $red
  #
  # #
  # # Disable xwayland
  # #
  # # xwayland disable
  #
  # #
  # # Status Bar:
  # #
  # bar swaybar_command waybar
  #
  # include /etc/sway/config.d/*
}
