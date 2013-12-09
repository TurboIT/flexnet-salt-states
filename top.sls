base:
  '*':
    - hosts
    - users
    - build-essential
    - tmux
    - git
    - mercurial
    - vim
    - vim.salt
    - vim.nerdtree
    - vim.pyflakes
    # - salt.master
    # - salt.minion
    # Disabling SSH states until 0.17 is installed,
    # due to incompatibilties with the formula.
    # - ssh.server
    # - ssh.client
  'web*.flexdeaf.dev':
    - apache.debian_full
