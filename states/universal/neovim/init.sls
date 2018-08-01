Ensure neovim is installed:
  pkg.installed:
    - name: neovim


Ensure vim-plug is installed:
  file.managed:
    - name: {{ grains.home }}/.local/share/nvim/site/autoload/plug.vim
    - makedirs: True
    - runas: {{ grains.user }}
    - source: https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - skip_verify: True


Ensure init.vim is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.config/nvim/init.vim
    - target: {{ grains.states_dir }}/universal/neovim/init.vim
    - force: True
    - makedirs: True
    - user: {{ grains.user }}


Ensure get-pyls is symlinked:
  file.symlink:
    - name: /usr/local/bin/get-pyls
    - target: {{ grains.states_dir }}/universal/neovim/get-pyls
    - force: True
    - makedirs: True
    - user: {{ grains.user }}


Ensure virtualenv is installed:
  pkg.installed:
    - name: python-virtualenv
    - allow_updates: True


Ensure python2 virtualenv:
  virtualenv.managed:
    - name: {{ grains.home }}/.venvs/neovim2
    - python: {{ grains.python2 }}
    - pip_pkgs:
      - neovim
      - python-language-server[all]
    - pip_upgrade: True
    - user: {{ grains.user }}


Ensure python3 virtualenv:
  virtualenv.managed:
    - name: {{ grains.home }}/.venvs/neovim3
    - python: {{ grains.python3 }}
    - pip_pkgs:
      - black
      - neovim
      - python-language-server[all]
    - pip_upgrade: True
    - user: {{ grains.user }}


Ensure plugins are installed and updated:
  cmd.run:
    - name: nvim +PlugUpgrade +PlugUpdate +PlugClean! +qall
    - hide_output: True
    - user: {{ grains.user }}
