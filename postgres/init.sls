# pkg.install
postgresql:
  pkg.installed:
    {% if grains['os_family'] == 'RedHat' %}
    - name: postgresql
    {% elif grains['os_family'] == 'Debian' %}
    - name: postgresql-9.1
    {% endif %}

{% for database in pillar['postgres']['databases'] %}
{{ database }}:
  postgres_database.present
{% endfor %}

{% for user in pillar['users'] %} 
{{ user }}:
  postgres_user.present:
    - createdb: True
    - createuser: True
    - encrypted: True
    - superuser: True
    - password: {{ pillar['postgres']['default_password'] }} 
    - runas: {{ user }}
{% endfor %} 
