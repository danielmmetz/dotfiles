Ensure Xmodmap config is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.Xmodmap
    - target: {{ grains.states_dir }}/linux/xmodmap/Xmodmap
    - force: True
    - user: {{ grains.user }}
