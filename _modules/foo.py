import salt.utils

def foo(bar):
	return __salt__['cmd.run'](bar)
