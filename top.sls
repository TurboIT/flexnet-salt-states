base:
  '*':
    - hosts
    - groups
    - users
    - build-essential
    - tmux
    - git
    - mercurial
    - vim
    - vim.salt
    - vim.nerdtree
    - vim.pyflakes
    - python-development
  'master*.flexdeaf.dev':
    - salt.master
  'web*.flexdeaf.dev':
    - apache
    - apache.mod_wsgi
    - apache.vhosts.standard
  'db*.flexdeaf.dev':
    - postgres
  'log*.flexdeaf.dev':
    - logstash
  'es*.flexdeaf.dev':
    - elasticsearch
