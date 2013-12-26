testfile:
  file.managed:
    - name: /tmp/testfile.txt
    - source: salt://test/testfile.txt.jinja
    - template: jinja
