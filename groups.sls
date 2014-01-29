{% for group in pillar.get('groups', []) %}
{{ group }}_user_group:
  group:
    - name: {{ group }}
    - present
{% endfor %}
