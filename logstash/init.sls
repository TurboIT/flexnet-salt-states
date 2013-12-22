openjdk-7-jre-headless:
  pkg.installed

logstash-group:
  group.present:
    - name: logstash

logstash-user:
  user.present:
    - name: logstash
    - groups:
      - logstash

/home/logstash/logstash-1.2.2-flatjar.jar:
  file.managed:
    - source: https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar 
    - source_hash: md5=f2ec9e54e13428ed6d5c96b218126a0e
    - user: logstash
    - group: logstash
    - mode: 644

/home/logstash/logstash.conf:
  file.managed:
    - source: salt://logstash/files/logstash.conf
    - user: logstash
    - group: logstash
    - mode: 644
