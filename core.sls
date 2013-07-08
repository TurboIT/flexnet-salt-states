vim:
  pkg:
    - installed

emacs:
  pkg:
    - installed

htop:
  pkg:
    - installed

subversion:
  pkg:
    - installed

mercurial:
  pkg:
    - installed

git:
  pkg:
    - installed

openvpn:
  pkg:
    - installed

/etc/motd:
  file.managed:
    - source: salt://etc/motd
	- mode: 644
	- user: root
	- group: root
