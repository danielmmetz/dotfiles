{ config, lib, pkgs, ... }:

{
  imports = [
    ./home-common.nix
    ./programs/pa-set-sink/pa-set-sink.nix
  ];

  home.packages = [
    pkgs.arandr
    pkgs.dmenu
    pkgs.mpv
    pkgs.networkmanager_dmenu
    pkgs.pavucontrol
    pkgs.pcmanfm
    pkgs.playerctl
    pkgs.psmisc
    pkgs.rofi
    pkgs.slack
    pkgs.speedtest-cli
    pkgs.wmctrl
    pkgs.xautolock
    pkgs.xclip
    pkgs.xorg.xbacklight
    pkgs.xorg.xev
    pkgs.xss-lock
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Arc";
      package = pkgs.arc-icon-theme;
    };
    theme = {
      name = "Arc";
      package = pkgs.arc-theme;
    };
  };


  programs.pa-set-sink.enable = true;

  services.polybar = import ./programs/polybar.nix { config = config; lib = lib; pkgs = pkgs; };
  services.redshift.enable = true;
  services.redshift.provider = "geoclue2";
  xsession.windowManager.i3 = import ./programs/i3/i3.nix { config = config; lib = lib; pkgs = pkgs; };
}
