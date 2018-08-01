{% if grains['os'] == 'Fedora' %}
Ensure RPMFusion Free repo:
  pkgrepo.managed:
    - name: rpmfusion-free
    - humanname: RPM Fusion for Fedora - Free
    - mirrorlist: http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch


Ensure RPMFusion Nonfree repo:
  pkgrepo.managed:
    - name: rpmfusion-nonfree
    - humanname: RPM Fusion for Fedora - Nonfree
    - mirrorlist: http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-$releasever&arch=$basearch


{% set copr_repos = ['oleastre/kitty-terminal', 'wyvie/i3blocks'] %}
{% for repo in copr_repos %}
Ensure COPR repo {{repo}}:
  cmd.run:
    - name: dnf copr enable {{ repo }} -y
{% endfor %}


Ensure repolist permissions:
  file.directory:
    - name: /etc/yum.repos.d
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - mode
{% endif %}


Ensure packages are installed:
  pkg.installed:
    - pkgs:
      - adobe-source-code-pro-fonts
      - arandr
      - chromium
      - compton
      - conky
      - ctags
      - exa
      - fasd
      - feh
      - fish
      - fzf
      - htop
      - i3blocks
      - lxappearance
      - mpv
      - ncdu
      - neovim
      - network-manager-applet
      - pcmanfm
      - powerline-fonts
      - python-virtualenv
      - ranger
      - redshift
      - ripgrep
      - rxvt-unicode
      - smplayer
      - the_silver_searcher
      - transmission-cli
      - unrar
      - zathura
      - zathura-pdf-mupdf
    {% if grains['os_family'] == 'Arch' %}
      - arc-gtk-theme
      - arc-icon-theme
      - pa-applet
      - playerctl
      - python-pip
      - rxvt-unicode-terminfo
      - ttf-ubuntu-font-family
      - yay
    {% elif grains['os'] == 'Fedora' %}
      - arc-theme
      - dropbox
      - fontawesome-fonts
      - google-chrome-stable
      - i3
      - i3lock
      - kitty
      - numix-gtk-theme
      - numix-icon-theme
      - ubuntu-title-fonts
    {% endif %}
    - allow_updates: True
