{ config, lib, pkgs, ... }:

let

  colors = {
    bg = "#222222";
    fg = "#2aa198";
    fg-alt = "#555555";
    icon-color = "#2aa198";

    trans = "#00000000";
    white = "#FFFFFF";
    black = "#000000";

    red = "#e53935";
    pink = "#d81b60";
    purple = "#8e24aa";
    deep-purple = "#5e35b1";
    indigo = "#3949ab";
    blue = "#1e88e5";
    light-blue = "#039be5";
    cyan = "#00acc1";
    teal = "#00897b";
    green = "#43a047";
    light-green = "#7cb342";
    lime = "#c0ca33";
    yellow = "#fdd835";
    amber = "#ffb300";
    orange = "#fb8c00";
    deep-orange = "#f4511e";
    brown = "#6d4c41";
    grey = "#757575";
    blue-gray = "#546e7a";
  };

  networkmanager-dmenu = "PATH=${config.home.profileDirectory}/bin ${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
  pa-set-sink = "PATH=/run/current-system/sw/bin ${config.home.profileDirectory}/bin/pa-set-sink";

in

{
  enable = true;
  script = "polybar bar &";
  package = pkgs.polybar.override {
    i3Support = true;
    pulseSupport = true;
    mpdSupport = true;
  };

  extraConfig = ''
  '';

  config = {
    "bar/bar" = {
      top = true;
      line-size = 2;
      module-margin = 1;
      modules-left = "i3";
      modules-right = "network wlan memory cpu backlight battery volume time date powermenu";
      font-0 = "Ubuntu:size=12;0";
      font-1 = "Font Awesome 5 Free:style=Solid:size=12;0";
      font-2 = "Font Awesome 5 Free:style=Regular:size=12;0";
      font-3 = "Font Awesome 5 Brands:size=12;0";
    };

    "module/volume" = {
      type = "internal/pulseaudio";
      format-volume = "%{A3:${pa-set-sink}:}<ramp-volume>%{A}";
      label-volume = "%percentage%%";
      format-muted = "%{A3:${pa-set-sink}:}<label-muted>%{A}";
      label-muted = "";
      label-muted-foreground = colors.fg-alt;
      ramp-volume-0 = "";
      ramp-volume-1 = "";
      ramp-volume-2 = "";
      ramp-volume-3 = "";
      ramp-volume-4 = "";
    };

    "module/date" = {
      type = "internal/date";
      date = " %e %B";
      label = "%date%";
    };

    "module/time" = {
      type = "internal/date";
      interval = "1.0";
      date = " %l:%M %p";
    };

    "module/i3" = {
      type = "internal/i3";
      format = "<label-state> <label-mode>";
      label-mode = "%mode%";
      label-mode-padding = "1";
      label-focused = "%index%";
      label-focused-foreground = colors.icon-color;
      label-focused-underline = colors.icon-color;
      label-focused-background = colors.bg;
      label-focused-padding = "2";
      label-unfocused = "%index%";
      label-unfocused-padding = "2";
      label-unfocused-foreground = colors.grey;
      label-urgent = "%index%";
      label-urgent-background = colors.red;
      label-urgent-padding = "2";
      label-visible = "%index%";
      label-visible-padding = "2";
      label-visible-foreground = colors.icon-color;
      label-visible-underline = colors.icon-color;
      label-visible-background = colors.bg;
    };

    "module/battery" = {
      type = "internal/battery";
      full-at = "100";
      label-discharging = "%percentage%%";
      label-charging = "%percentage%%";
      label-full = "%percentage%%";
      format-discharging = "<ramp-capacity> <label-discharging>";
      format-full = "<ramp-capacity> <label-full>";
      format-charging = " <label-charging>";
      ramp-capacity-0 = "";
      ramp-capacity-1 = "";
      ramp-capacity-2 = "";
      ramp-capacity-3 = "";
      ramp-capacity-4 = "";
      animation-charging-0 = "";
      animation-charging-1 = "";
      animation-charging-2 = "";
      animation-charging-3 = "";
      animation-charging-4 = "";
      animation-charging-foreground = "#228B22";
      animation-charging-framerate = "750";
    };

    "module/wlan" = {
      type = "internal/network";
      interface = "wlp4s0";
      interval = "5";
      label-connected = "%{A1:${networkmanager-dmenu}:} %essid%%{A}";
      label-disconnected = "%{A1:${networkmanager-dmenu}:} Not Connected%{A}";
    };

    "module/backlight" = {
      type = "internal/backlight";
      card = "intel_backlight";
      format = "<ramp> <label>";
      label = "%percentage%%";
      ramp-0 = "";
      ramp-1 = "";
      ramp-2 = "";
    };

    "module/cpu" = {
      type = "internal/cpu";
      label = " %percentage:02%%";
    };

    "module/memory" = {
      type = "internal/memory";
      label = " %gb_used%";
    };

    "module/network" = {
      type = "internal/network";
      interface = "wlp4s0";
      label-connected = " %downspeed%   %upspeed%";
    };

    "module/powermenu" = {
      type = "custom/menu";
      expand-right = "false";
      label-open = "";
      label-close = "";
      label-separator = "/";
      label-separator-margin = "1";
      menu-0-0 = "";
      menu-0-0-foreground = colors.fg-alt;
      menu-0-0-exec = "i3-msg exit";
      menu-0-1 = "";
      menu-0-1-foreground = colors.fg-alt;
      menu-0-1-exec = "menu-open-1";
      menu-0-2 = "";
      menu-0-2-foreground = colors.fg-alt;
      menu-0-2-exec = "menu-open-2";
      menu-0-3 = "";
      menu-0-3-foreground = colors.fg-alt;
      menu-0-3-exec = "${pkgs.i3lock}/bin/i3lock -c 000000";

      menu-1-0 = "";
      menu-1-0-foreground = colors.fg-alt;
      menu-1-0-exec = "shutdown -r now";
      menu-1-1 = "";
      menu-1-1-foreground = colors.fg-alt;
      menu-1-1-exec = "menu-open-0";

      menu-2-0 = "";
      menu-2-0-foreground = colors.fg-alt;
      menu-2-0-exec = "shutdown now";
      menu-2-1 = "";
      menu-2-1-foreground = colors.fg-alt;
      menu-2-1-exec = "menu-open-0";
    };
  };
}
