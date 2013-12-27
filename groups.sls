{% for group in pillar.get('groups', []) %}
{{ group }}_group:
  group:
    - name: {{ group }}
    - present
{% endfor %}
