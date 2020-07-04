Ensure iterm2 plist is symlinked:
  file.symlink:
    - name: {{ grains.home }}/Library/Preferences/com.googlecode.iterm2.plist
    - target: {{ grains.states_dir }}/macos/iterm2/com.googlecode.iterm2.plist
    - force: True
    - user: {{ grains.user }}
