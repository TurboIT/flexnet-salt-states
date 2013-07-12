# First user
# Figure out how to set SSH key

timoguin:
  user.present:
    - shell: /bin/bash
    - home: /home/timoguin
    - createhome: true
    - uid: 1000
    - gid: 1000
    - groups:
      - sudo 
    - password: none  
