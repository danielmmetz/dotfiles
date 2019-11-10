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
        "${modifier}+Control+l" = "exec --no-startup-id loginctl lock-session";
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
    };
    startup = [
      { command = "feh --bg-fill ${./matador-rocks.jpg}"; always = true; notification = false; }
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
