{ config, lib, pkgs, ... }:

{
  enable = true;
  config = {
    bars = [];
    keybindings =
      let
        modifier = config.xsession.windowManager.i3.config.modifier;
      in

      lib.mkOptionDefault {
        "${modifier}+d" = "exec --no-startup-id ${pkgs.dmenu}/bin/dmenu_run";
        "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
        "${modifier}+b" = "exec ${pkgs.firefox}/bin/firefox";
        "${modifier}+Control+l" = "exec --no-startup-id ${pkgs.xidlehook}/bin/xidlehook-client --socket /tmp/xidlehook.sock --trigger";
        "${modifier}+Shift+e" = "exec i3-nagbar -t warning -m 'Do you want to logout?' -B 'Yes' 'loginctl terminate-user $(whoami)'";

        "${modifier}+a" = "focus parent";
        "${modifier}+g" = "split h";
        "${modifier}+v" = "split v";

        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        "${modifier}+r" = null;
        "XF86MonBrightnessUp" = "exec ${pkgs.xorg.xbacklight}/bin/xbacklight -inc 5";
        "XF86MonBrightnessDown" = "exec ${pkgs.xorg.xbacklight}/bin/xbacklight -dec 5";

        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% #increase sound volume";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% #decrease sound volume";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle # mute sound";

        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
    };
    startup = [
      { command = "${pkgs.feh}/bin/feh --bg-fill ${./matador-rocks.jpg}"; always = true; notification = false; }
      { command = "systemctl --user restart polybar"; always = true; notification = false; }
      { command = "${pkgs.xss-lock}/bin/xss-lock -- ${pkgs.i3lock}/bin/i3lock --nofork --color 000000"; always = true; notification = false; }
      {
        command = ''
          ${pkgs.xidlehook}/bin/xidlehook \
          --socket /tmp/xidlehook.sock \
          --not-when-fullscreen \
          --timer primary 120 '${pkgs.i3lock}/bin/i3lock --nofork --color 000000' ""
        '';
        always = true;
        notification = false;
      }
    ];
    window.border = 5;
    # https://userbase.kde.org/Tutorials/Using_Other_Window_Managers_with_Plasma
    window.commands = [
      { criteria = { title = "Desktop — Plasma"; }; command = "kill; floating enable; border none"; }
      { criteria = { class = "plasmashell"; }; command = "floating enable;"; }
      { criteria = { class = "Plasma"; }; command = "floating enable; border none"; }
      { criteria = { title = "plasma-desktop"; }; command = "floating enable; border none"; }
      { criteria = { title = "win7"; }; command = "floating enable; border none"; }
      { criteria = { class = "krunner"; }; command = "floating enable; border none"; }
      { criteria = { class = "Kmix"; }; command = "floating enable; border none"; }
      { criteria = { class = "Klipper"; }; command = "floating enable; border none"; }
      { criteria = { class = "Plasmoidviewer"; }; command = "floating enable; border none"; }
      { criteria = { class = "(?i)*nextcloud*"; }; command = "floating disable"; }
      { criteria = { class = "plasmashell"; window_type = "notification"; }; command = "floating enable, border none, move right 700px, move down 450px, no_focus"; }
    ];
  };
}
