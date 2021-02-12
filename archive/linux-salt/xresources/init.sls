Ensure colorscheme is symlinked:
  file.symlink:
    - name: /usr/local/share/xresources-themes/base16-solarized-dark.Xresources
    - target: {{ grains.states_dir }}/linux/xresources/base16-solarized-dark.Xresources
    - makedirs: True
    - force: True
    - user: {{ grains.user }}


Ensure Xresources config is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.Xresources
    - target: {{ grains.states_dir }}/linux/xresources/Xresources
    - force: True
    - user: {{ grains.user }}


Ensure Xresources config is loaded:
  cmd.run:
    - name: xrdb -load {{ grains.home }}/.Xresources
    - user: {{ grains.user }}
