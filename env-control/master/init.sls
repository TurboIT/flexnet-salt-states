/root/testfile.txt:
  file.managed:
    - source: salt://env-control/master/testfile.txt
    - mode: 644
    - user: root
    - group: root
