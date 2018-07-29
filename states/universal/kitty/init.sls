Ensure kitty.conf is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.config/kitty/kitty.conf
    - target: {{ grains.states_dir }}/universal/kitty/kitty.conf
    - makedirs: True
    - force: True
    - user: {{ grains.user }}
