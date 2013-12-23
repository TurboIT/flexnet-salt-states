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

{% for provider in salt['pillar.get']('salt:cloud:providers').iteritems() %}
/etc/salt/cloud.providers.d/{{ provider }}.conf:
  file.managed:
    - user: {{ salt['pillar.get']('salt:master:user', 'salt') }}
    - group: {{ salt['pillar.get']('salt:master:user', 'salt') }}
{% for provider_sub in provider.items() %}
  file.append:
    - text: {{ provider_sub }}
{% endfor %}
{% endfor %}

/etc/salt/cloud.maps.d:
  file.directory:
    - user: {{ salt['pillar.get']('salt:master:user', 'salt') }}
    - group: {{ salt['pillar.get']('salt:master:user', 'salt') }}
    - mode: 775
    - makedirs: True
