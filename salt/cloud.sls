salt-cloud:
  pkg.installed

/etc/salt/cloud:
  file.append:
    - text:
      - {{ salt['pillar.get']('salt:minion', 'master: localhost') }}

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
