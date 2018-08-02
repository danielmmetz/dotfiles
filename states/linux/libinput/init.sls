{% if grains['os_family'] == 'Arch' %}
Ensure natural scrolling is enabled:
  file.symlink:
    - name: /usr/share/X11/xorg.conf.d/20-natural-scrolling.conf
    - target: {{ grains.states_dir }}/linux/libinput/20-natural-scrolling.conf.arch
{% endif %}

{% if grains['os'] == 'Fedora' %}
Ensure natural scrolling is enabled:
  file.symlink:
    - name: /usr/share/X11/xorg.conf.d/20-natural-scrolling.conf
    - target: {{ grains.states_dir }}/linux/libinput/20-natural-scrolling.conf.fedora
{% endif %}

{% if grains['os'] == 'Fedora' %}
Ensure xbacklight functions:
  file.symlink:
    - name: /usr/share/X11/xorg.conf.d/20-video.conf
    - target: {{ grains.states_dir }}/linux/libinput/20-video.conf
{% endif %}
