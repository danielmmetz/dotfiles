{ config, lib, pkgs, ... }:

{
  imports = [ ./home-common.nix ];

  home.packages = [
    pkgs.pcmanfm
    pkgs.psmisc
    pkgs.xclip
    pkgs.wmctrl
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

  services.redshift.enable = true;
  services.redshift.provider = "geoclue2";
  # services.redshift.tray = true;
  xsession.windowManager.i3 = import ./programs/i3/i3.nix { config = config; lib = lib; pkgs = pkgs; };
}
