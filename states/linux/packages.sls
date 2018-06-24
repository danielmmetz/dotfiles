Ensure packages are installed:
  pkg.installed:
    - pkgs:
      - adobe-source-code-pro-fonts
      - arandr
      - compton
      - conky
      - ctags
      - dropbox
      - exa
      - fasd
      - feh
      - fish
      - fzf
      - google-chrome-stable
      - htop
      - i3
      - i3lock
      - lxappearance
      - mpv
      - ncdu
      - neovim
      - network-manager-applet
      - pcmanfm
      - powerline-fonts
      - ranger
      - redshift
      - ripgrep
      - rxvt-unicode
      - smplayer
      - transmission-cli
      - unrar
      - zathura
      - zathura-pdf-mupdf
    {% if grains['os'] == 'Arch' %}
      - arc-gtk-theme
      - arc-icon-theme
      - pa-applet
      - playerctl
      - rxvt-unicode-terminfo
      - spotify
      - ttf-font-awesome
      - ttf-ubuntu-font-family
      - urxvt-resize-font-git
      - urxvt-vtwheel
    {% elif grains['os'] == 'Fedora' %}
      - arc-theme
      - fontawesome-fonts
      - numix-gtk-theme
      - numix-icon-theme
      - ubuntu-title-fonts
    {% endif %}
    - allow_updates: True
