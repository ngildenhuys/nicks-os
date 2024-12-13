{config, ...}: {
  config = {
    # enable wayland sway window manager

    hardware.pulseaudio.enable = true;
    home-manager.users.${config.user}.programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          modules-left = ["sway/workspaces" "sway/window" "sway/mode"];
          modules-right = ["bluetooth" "pulseaudio" "backlight" "network" "battery" "clock"];
          bluetooth = {
            # format-icons = ["󰂲" "󰂯"];
            on-click = "blueman-manager";
          };
          clock = {
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = "{:%b %d(%H:%M) 󰃰}";
          };
          backlight = {
            format = "{percent}% {icon}";
            format-icons = ["" "" "" "" "" "" "" "" ""];
            on-scroll-up = "light -A 1";
            on-scroll-down = "light -U 1";
          };
          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% 󰢝";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = ["" "" "" "" ""];
          };
          pulseaudio = {
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = "󰝟 {icon} {format_source}";
            format-muted = "󰝟 {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "󱠰";
              headset = "󰋎";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
            on-click = "pavucontrol";
          };
          network = {
            format = "{ifname}";
            format-wifi = "Connected ";
            format-ethernet = "{ipaddr}/{cidr} 󰈀";
            format-disconnected = "Disconnected 󱛅"; # An empty format will hide the module.
            tooltip-format = "{ifname} via {gwaddr} 󰛳";
            tooltip-format-wifi = "{essid} ({signalStrength}%) ";
            tooltip-format-ethernet = "{ifname} ";
            tooltip-format-disconnected = "Disconnected";
            max-length = 50;
          };
        };
      };
    };
  };
}
