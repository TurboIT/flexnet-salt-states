{% from "salt/package-map.jinja" import pkgs with context %}

salt-master:
  pkg.installed:
    - name: {{ pkgs['salt-master'] }}
  file.managed:
    - name: /etc/salt/master
    - template: jinja
    - source: salt://salt/files/master
    - user: salt
    - group: salt
    - mode: 660
  service.running:
    - enable: True
    - watch:
      - pkg: salt-master
      - file: salt-master
