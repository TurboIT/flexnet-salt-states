import salt.utils

def do(bar):
	return __salt__['cmd.run'](bar)
