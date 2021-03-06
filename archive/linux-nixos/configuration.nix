# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "metz-x1"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];
  networking.networkmanager.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;
  networking.interfaces.wwp0s20f0u6i12.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  nix.allowedUsers = [ "metz" ];

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };
  console.useXkbConfig = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";
  location.provider = "geoclue2";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    brightnessctl
    firefox
    git
    vim
    zsh

    gnome3.zenity
    (perl.withPackages(p: [ p.NetTelnet ]))
    (openvpn.override { pkcs11Support = true; pkcs11helper = pkgs.pkcs11helper; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;

  services.dnsmasq.enable = true;
  services.dnsmasq.extraConfig = ''
    server=/lyft.net/192.168.144.1
    server=/lyft.net/192.168.192.1
    server=/lyft.net/192.168.160.1
    server=/lyft.net/192.168.194.1
    server=/lyft.net/192.168.176.1
    server=/lyft.net/192.168.196.1
    server=/jira.lyft.net/#
    server=/confluence.lyft.net/#
  '';


  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.bluetooth.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  services.pcscd.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "ctrl:nocaps";

  services.xserver.autoRepeatDelay = 250;
  services.xserver.autoRepeatInterval = 40;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;
  services.xserver.libinput.disableWhileTyping = true;
  services.xserver.libinput.tapping = false;
  services.xserver.libinput.naturalScrolling = true;

  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.deviceSection = ''
    Option "TearFree" "true"
  '';

  # Enable the KDE Desktop Environment.
  services.dbus.packages = with pkgs; [ gnome3.dconf ];
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.i3.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.metz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.zsh;
  };

  system.autoUpgrade.enable = true;
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
