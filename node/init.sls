{% set node = pillar.get('node', {}) -%}
{% set version = node.get('version', '0.8.20') -%}
{% set checksum = node.get('checksum', 'b780f58f0e3bc43d2380d4a935f2b45350783b37') -%}
git_packages:
  pkg.installed:
    - names:
      - libssl-dev
      - git
      - pkg-config
      - build-essential
      - curl
      - gcc
      - g++
      - checkinstall

## Get Node
get-node:
  file.managed:
    - name: /usr/src/node-v{{ version }}.tar.gz
    - source: http://nodejs.org/dist/v{{ version }}/node-v{{ version }}.tar.gz
    - source_hash: sha1={{ checksum }}
    - require:
      - pkg: git_packages
  cmd.wait:
    - cwd: /usr/src
    - names:
      - tar -zxvf node-v{{ version }}.tar.gz
    - watch:
      - file: node-{{ version }}

make-node:
  cmd.wait:
    - cwd: /usr/src/node-v{{ version }}
    - names:
      - ./configure
      - make
      - checkinstall --install=yes --pkgname=nodejs --pkgversion "{{ version }}" --default     
    - watch:
      - cmd: get-node
