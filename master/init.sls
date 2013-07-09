/root/testfile.txt:
  file.managed:
    - source: salt://root/testfile.txt
    - mode: 644
    - user: root
    - group: root
