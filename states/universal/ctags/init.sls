Ensure ctags config is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.ctags
    - target: {{ grains.states_dir }}/universal/ctags/ctags
    - force: True
    - user: {{ grains.user }}
