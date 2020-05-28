{ config, lib, pkgs, ... }:

{
  imports = [
    ./home-common.nix
  ];

  home.packages = [];
  home.stateVersion = "20.03";

  programs.home-manager.enable = true;

  programs.zsh.shellAliases = {
    homerc = "cd $DOTFILES && nvim ./states/nixos/home-macos.nix && cd -$";
  };
}
