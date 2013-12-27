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

/home/logstash/logstash-1.3.2-flatjar.jar:
  file.managed:
    - source: https://download.elasticsearch.org/logstash/logstash/logstash-1.3.2-flatjar.jar 
    - source_hash: md5=538caf2e67023d3fac4098d8bbfd3270
    - user: logstash
    - group: logstash
    - mode: 644

/home/logstash/logstash.conf:
  file.managed:
    - source: salt://logstash/files/logstash.conf
    - user: logstash
    - group: logstash
    - mode: 644
