base:
  '*':
    - standard 

  'network:control'
    - match: grain
	- env-control
  'network:core'
    - match: grain
	- env-core
  'network:edge'
    - match: grain
	- env-edge
  'network:mgmt'
    - match: grain
	- env-mgmt
