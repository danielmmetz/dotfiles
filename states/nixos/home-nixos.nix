{ config, lib, pkgs, ... }:

{
  imports = [
    ./home-common.nix
    ./programs/pa-set-sink/pa-set-sink.nix
  ];

  home.packages = [
    pkgs.arandr
    pkgs.autorandr
    pkgs.calibre
    pkgs.compton
    pkgs.dmenu
    pkgs.gcc
    pkgs.gnumake
    pkgs.gptfdisk
    pkgs.networkmanager_dmenu
    pkgs.pavucontrol
    pkgs.pcmanfm
    pkgs.pipenv
    pkgs.playerctl
    pkgs.pythonPackages.python-language-server
    pkgs.psmisc
    pkgs.rofi
    pkgs.slack
    pkgs.speedtest-cli
    pkgs.usbutils
    pkgs.wmctrl
    pkgs.xautolock
    pkgs.xclip
    pkgs.xidlehook
    pkgs.xorg.xbacklight
    pkgs.xorg.xev
    pkgs.xss-lock
    (pkgs.zathura.override { useMupdf = true; })
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
  programs.zsh.shellAliases = {
    homerc = "cd $DOTFILES && nvim ./states/nixos/home-nixos.nix && cd -$";
    nixosrc = "cd $DOTFILES && sudo nvim ./states/nixos/configuration.nix && cd -$";
  };

  services.polybar = import ./programs/polybar.nix { config = config; lib = lib; pkgs = pkgs; };
  services.redshift.enable = true;
  services.redshift.provider = "geoclue2";
  services.udiskie = { enable = true; notify = false; };
  xsession.windowManager.i3 = import ./programs/i3/i3.nix { config = config; lib = lib; pkgs = pkgs; };
}
