/etc/hosts:
  file.managed:
    source: salt://hosts/files/hosts
	user: root
	group: root
	mode: 755
	template: jinja
