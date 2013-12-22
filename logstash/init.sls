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
    - user: logstash
    - group: logstash
    - mode: 644

/home/logstash/logstash.conf:
  file.managed:
    - source: salt://logstash/files/logstash.conf
    - user: logstash
    - group: logstash
    - mode: 644

start-service-w-web:
  cmd.run:
    - name: java -jar logstash-1.2.2-flatjar.jar agent -f logstash.conf -- web
    - cwd: /home/logstash
    - user: logstash
