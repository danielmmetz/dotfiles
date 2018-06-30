Ensure .profile is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.profile
    - target: {{ grains.states_dir }}/universal/fish/profile
    - makedirs: True
    - force: True
    - user: {{ grains.user }}

Ensure config.fish is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.config/fish/config.fish
    - target: {{ grains.states_dir }}/universal/fish/config.fish
    - makedirs: True
    - force: True
    - user: {{ grains.user }}


{% for fpath in salt['file.find'](path='states/universal/fish/functions', name='*.fish') %}
{% set fname = fpath.split('/')[-1] %}
Ensure function {{ fname }} is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.config/fish/functions/{{ fname }}
    - target: {{ grains.states_dir }}/universal/fish/functions/{{ fname }}
    - makedirs: True
    - force: True
    - user: {{ grains.user }}
{% endfor %}


Ensure fisherman is installed:
  file.managed:
    - name: {{ grains.home }}/.config/fish/functions/fisher.fish
    - makedirs: True
    - user: {{ grains.user }}
    - mode: 777
    - source: https://git.io/fisher
    - skip_verify: True


Ensure fishfile is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.config/fish/fishfile
    - target: {{ grains.states_dir }}/universal/fish/fishfile
    - makedirs: True
    - force: True
    - user: {{ grains.user }}


Ensure plugins are installed:
  cmd.run:
    - name: fish -c fisher
    - runas: {{ grains.user }}


Ensure fish is an allowed shell:
  cmd.run:
    - name: echo $(which fish) | sudo tee -a /etc/shells
    - user: {{ grains.user }}
    - unless: grep fish /etc/shells


Ensure fish is the default shell:
  cmd.run:
    - name: chsh -s $(which fish) {{ grains.user }}
    - unless: 'su {{ grains.user }} -c echo $SHELL | grep fish'
