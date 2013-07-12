# First user
# Figure out how to set SSH key

timoguin:
  user.present:
    - shell: /bin/bash
    - home: /home/timoguin
    - createhome: true
    - groups:
      - sudo 
