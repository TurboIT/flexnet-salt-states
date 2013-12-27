{% for group in pillar.get('groups', []) %}
{{ group }}:
  group:
    - present
{% endfor %}
