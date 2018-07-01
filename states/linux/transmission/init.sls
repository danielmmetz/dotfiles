Ensure transmission settings.json is symlinked:
  file.symlink:
    - name: /var/lib/transmission/.config/transmission-daemon/settings.json
    - target: {{ grains.states_dir }}/linux/transmission/settings.json
    - makedirs: True
    - force: True
    - user: transmission


Ensure transmission can access the Downloads dir:
  acl.present:
    - name: {{ grains.home }}
    - acl_type: group
    - acl_name: transmission
    - perms: x


Ensure transmission can modify contents within Downloads:
  acl.present:
    - name: {{ grains.home }}/Downloads
    - acl_type: group
    - acl_name: transmission
    - perms: wrx


{% if grains['os_family'] in ('Arch', 'Fedora') %}
{% set daemon_name = 'transmission' if grains['os_family'] == 'Arch' else 'transmission-daemon' %}
Ensure transmission service is enabled:
  cmd.run:
    - name: systemctl enable {{ daemon_name }}
    - unless: systemctl status {{ daemon_name }} | grep enabled


Ensure transmission is running:
  cmd.run:
    - name: systemctl start {{ daemon_name }}
    - unless: systemctl status {{ daemon_name }} | grep running
{% endif %}
