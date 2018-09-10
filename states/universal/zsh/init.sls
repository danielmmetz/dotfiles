Ensure zplug is installed:
  git.latest:
    - name: https://github.com/zplug/zplug
    - target: {{ grains.home }}/.zplug
    - user: {{ grains.user }}
    - force_reset: True
    - unless: test -d "{{ grains.home }}/.zplug"

Ensure zsh config is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.zshrc
    - target: {{ grains.states_dir }}/universal/zsh/zshrc
    - force: True
    - user: {{ grains.user }}

Ensure zsh is the default shell:
  user.present:
    - name: {{ grains.user }}
    - shell: /usr/local/bin/zsh
