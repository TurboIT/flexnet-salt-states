openjdk-7-jre-headless:
  pkg.installed

es-group:
  group.present:
    - name: es 

es-user:
  user.present:
    - name: es 
    - groups:
      - es 

/home/es/elasticsearch-0.90.8.tar.gz:
  file.managed:
    - source: https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.8.tar.gz
    - source_hash: md5=f188f8f3b8d0c4b6185134c99905adc9
    - user: es
    - group: es
    - mode: 644

unzip-es-archive:
  cmd.run:
    - name: tar -xvzpf elasticsearch-0.90.8.tar.gz
    - cwd: /home/es
    - user: es
