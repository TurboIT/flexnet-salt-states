/root/testfile.txt:
  file.managed:
    - source: salt://env-control/testfile.txt
    - mode: 644
    - user: root
    - group: root

/root/testfile2txt:
  file.managed:
    - source: salt://env-control/testfile2.txt
    - mode: 644
    - user: root
    - group: root
