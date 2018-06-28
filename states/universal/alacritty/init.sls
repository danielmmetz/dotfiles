Ensure alacritty.yaml is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.config/alacritty/alacritty.yml
    - target: {{ grains.states_dir }}/universal/alacritty/alacritty.yml
    - makedirs: True
    - force: True
    - user: {{ grains.user }}
