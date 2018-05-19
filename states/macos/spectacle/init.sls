Ensure spectacle is configured:
  file.symlink:
    - name: {{ grains.home }}/Library/Application Support/Spectacle/Shortcuts.json
    - target: {{ grains.states_dir }}/macos/spectacle/Shortcuts.json
    - force: True
    - makedirs: True
    - user: {{ grains.user }}
