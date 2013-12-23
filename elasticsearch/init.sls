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

/home/es/elasticsearch-0.90.8.deb:
  file.managed:
    - source: https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.8.deb
    - source_hash: md5=94230008c6670f5b36e934b213a769cf
    - user: es
    - group: es
    - mode: 644
