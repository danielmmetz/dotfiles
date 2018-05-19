Ensure Dock is oriented left:
  macdefaults.write:
    - domain: com.apple.Dock
    - name: orientation
    - value: left
    - vtype: string
    - user:  {{ grains.user }}

Ensure Dock autohide:
  macdefaults.write:
    - domain: com.apple.Dock
    - name: autohide
    - value: True
    - vtype: bool
    - user:  {{ grains.user }}

Ensure Dock minimization mineffect is scale:
  macdefaults.write:
    - domain: com.apple.Dock
    - name: mineffect
    - value: scale
    - vtype: string
    - user:  {{ grains.user }}

Ensure Dock tilesize is small:
  macdefaults.write:
    - domain: com.apple.Dock
    - name: tilesize
    - value: 24
    - vtype: int
    - user:  {{ grains.user }}


Relaunch Dock for changes to take effect:
  cmd.run:
    - name: killall Dock
