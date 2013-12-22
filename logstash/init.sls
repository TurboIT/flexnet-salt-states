openjdk-7-jre-headless:
  pkg.installed

logstash-user:
  user.present:
    - name: logstash

/home/logstash/logstash-1.2.2-flatjar.jar:
  file.managed:
    - source: https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar 
    - user: logstash
    - group: logstash
    - mode: 644
