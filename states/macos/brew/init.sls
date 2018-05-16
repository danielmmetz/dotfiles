Ensure MacOS-specific cask packages:
  cmd.run:
    - name: brew update && brew bundle install
    - cwd: {{ grains.states_dir }}/macos/brew
    - runas: {{ grains.user }}
