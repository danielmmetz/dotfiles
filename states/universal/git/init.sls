Ensure gitconfig is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.gitconfig
    - target: {{ grains.states_dir }}/universal/git/gitconfig
    - force: True
    - user: {{ grains.user }}


Ensure gitignore is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.gitignore
    - target: {{ grains.dotfiles_dir }}/.gitignore
    - force: True
    - user: {{ grains.user }}
