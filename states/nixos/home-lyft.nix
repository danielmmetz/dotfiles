{ config, lib, pkgs, ... }:

{
  imports = [
  ];

  home.packages = [
    pkgs.aws-okta
    pkgs.awscli
    pkgs.dep
    pkgs.lsb-release
    pkgs.slack
  ];

  xdg.configFile."pip/pip.conf".text = ''
    [global]
    extra-index-url = https://pypi.lyft.net/pypi/
  '';
}
