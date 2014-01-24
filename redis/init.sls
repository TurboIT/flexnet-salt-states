redis:
  pkgrepo.managed:
    - ppa: rwky/redis

  module.run:
    - name: pkg.refresh_db

  pkg.installed:
    - name: redis-server

  service.running:
    - name: redis-server
    - enable: True
    - reload: True
    - watch:
      - file: /etc/redis

  file.recurse:
    - name: /etc/redis
    - source: salt://redis/files
    - user: root
    - group: root
