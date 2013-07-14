# First user
# Figure out how to set SSH key

timoguin:
  user.present:
    - fullname: "Tim O'Guin"
    - shell: /bin/zsh
    - home: /home/timoguin
    - createhome: true
    - groups:
      - sudo 
    - password: none  

wrench:
  user.present:
    - fullname: "Ben Tate"
    - shell: /bin/bash
    - home: /home/wrench
    - createhome: true
    - groups:
      - sudo 
    - password: none  
