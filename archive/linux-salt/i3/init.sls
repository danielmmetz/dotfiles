Ensure i3 config is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.config/i3/config
    - target: {{ grains.states_dir }}/linux/i3/config
    - makedirs: True
    - force: True
    - user: {{ grains.user }}


Ensure i3blocks.conf is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.config/i3blocks/i3blocks.conf
    - target: {{ grains.states_dir }}/linux/i3/i3blocks.conf
    - makedirs: True
    - force: True
    - user: {{ grains.user }}


{% for fpath in salt['file.find'](path='states/linux/i3/i3blocks', type='f') %}
{% set fname = fpath.split('/')[-1] %}
Ensure i3block {{ fname }} is symlinked:
  file.symlink:
    - name: {{ grains.home }}/.local/share/i3blocks/{{ fname }}
    - target: {{ grains.states_dir }}/linux/i3/i3blocks/{{ fname }}
    - makedirs: True
    - force: True
    - user: {{ grains.user }}
{% endfor %}
