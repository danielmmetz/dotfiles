Ensure wallpaper is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.local/share/feh/wallpaper-grey.jpg
    - target: {{ grains.states_dir }}/linux/feh/wallpaper-grey.jpg
    - makedirs: True
    - force: True
    - user: {{ grains.user }}
