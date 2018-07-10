Ensure chunkwmrc is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.chunkwmrc
    - target: {{ grains.states_dir }}/macos/chunkwm/chunkwmrc
    - force: True
    - user: {{ grains.user }}

Ensure skhdrc is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.skhdrc
    - target: {{ grains.states_dir }}/macos/chunkwm/skhdrc
    - force: True
    - user: {{ grains.user }}
