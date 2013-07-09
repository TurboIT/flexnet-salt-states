/root/testfile.txt:
  file.managed:
    - source: salt://env-control/testfile.txt
    - mode: 644
    - user: root
    - group: root
