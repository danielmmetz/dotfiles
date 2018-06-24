Ensure transmission settings.json is symlinked:
  file.symlink:
    - name: /var/lib/transmission/.config/transmission-daemon/settings.json
    - target: {{ grains.states_dir }}/linux/transmission/settings.json
    - makedirs: True
    - force: True


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


{% if grains['os'] in ('Arch', 'Fedora') %}
{% set daemon_name = 'transmission' if grains['os'] == 'Arch' else 'transmission-daemon' %}
Ensure transmission service is enabled:
  service.enabled:
    - name: {{ daemon_name }}


Ensure transmission is running:
  service.running:
    - name: {{ daemon_name }}
{% endif %}
