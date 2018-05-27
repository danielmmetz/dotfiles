Ensure i3 config is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.config/i3/config
    - target: {{ grains.states_dir }}/linux/i3/config
    - makedirs: True
    - force: True
    - user: {{ grains.user }}

