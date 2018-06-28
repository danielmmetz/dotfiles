{% if grains['os_family'] in ('Arch', 'Fedora') %}
Ensure natural scrolling is enabled:
  file.symlink:
    - name: /usr/share/X11/xorg.conf.d/20-natural-scrolling.conf
    {% if grains['os_family'] == 'Arch' %}
    - target: {{ grains.states_dir }}/linux/libinput/20-natural-scrolling.conf.arch
    {% elif grains['os_family'] == 'Fedora' %}
    - target: {{ grains.states_dir }}/linux/libinput/20-natural-scrolling.conf.fedora
    {% endif %}
{% endif %}
