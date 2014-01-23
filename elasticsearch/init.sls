elasticsearch-installer:
  file.managed:
    - name: /home/vagrant/elasticsearch-0.90.10.deb
    - source: http://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.10.deb
    - source_hash: md5=f01196f101a6c074b260d47d915a558f
    - user: vagrant
    - group: vagrant
    - mode: 644

elasticsearch:
  cmd.run:
    - name: dpkg -i /home/vagrant/elasticsearch-0.90.10.deb
    - unless: dpkg -s elasticsearch
    - require:
      - file: elasticsearch-installer

# Put config file in place
elasticsearch-configs:
  file.recurse:
    - name: /etc/elasticsearch
    - source: salt://elasticsearch/files
    - include_empty: True

# Make sure service is started.
elasticsearch-service:
  service.running:
    - name: elasticsearch
    - enable: True 

    # This doesn't work yet for some reason.
    # Once it does, the service will restart
    # automatically when the config directory
    # gets touched.

    # - reload: True
    # - watch:
    #   - file: elasticsearch-configs
