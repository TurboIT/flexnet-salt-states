salt-cloud:
  pkg.installed

/etc/salt/cloud:
  file.managed:
    - source: salt://salt/files/cloud.template.jinja
    - user: {{ salt['pillar.get']('salt:master:user', 'salt') }}
    - group: {{ salt['pillar.get']('salt:master:user', 'salt') }}
    - template: jinja
    - context:
      minion_info: {{ salt['pillar.get']('salt:minion', 'master: localhost') }}

{% for provider in salt['pillar.get']('salt:cloud:providers') %}
/etc/salt/cloud.providers.d/{{ provider }}.conf:
  file.managed:
    - user: {{ salt['pillar.get']('salt:master:user', 'salt') }}
    - group: {{ salt['pillar.get']('salt:master:user', 'salt') }}
    - source: salt://salt/files/cloud-providers.template.jinja
    - template: jinja
    - context:
      provider: {{ provider }}
{% endfor %}

/etc/salt/cloud.maps.d:
  file.directory:
    - user: {{ salt['pillar.get']('salt:master:user', 'salt') }}
    - group: {{ salt['pillar.get']('salt:master:user', 'salt') }}
    - mode: 775
    - makedirs: True

{% for cloud_map in salt['pillar.get']('salt:cloud:map
