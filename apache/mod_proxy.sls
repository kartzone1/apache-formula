{% if grains['os_family']=="Debian" %}

include:
  - apt
  - apache

a2enmod proxy:
  cmd.run:
    - unless: ls /etc/apache2/mods-enabled/proxy.load
    - order: 225
    - require:
      - pkg: apache
    - watch_in:
      - cmd: apache-restart

{% endif %}
