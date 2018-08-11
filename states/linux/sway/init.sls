Ensure sway config is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.config/sway/config
    - target: {{ grains.states_dir }}/linux/sway/config
    - makedirs: True
    - force: True
    - user: {{ grains.user }}
