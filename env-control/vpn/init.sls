/etc/openvpn/server.conf:
  file.managed:
    - source: salt://env-control/vpn/server.conf
    - user: root
    - group: root
