import requests
import json

def compileBatsh(code, target):

	payload = {'target': target, 'code': code}
	headers = {'content-type': 'application/json'}
	r = requests.post('http://batsh.org/compile', data=json.dumps(payload),  headers=headers)

	decoded_data = json.loads(r.text)
	return decoded_data['code']

f=open('habitrpg-shell.batsh', 'r')
code = f.read()
f.close()

bash = compileBatsh(code, 'bash')
winbat = compileBatsh(code, 'winbat')


f=open('tail/habitrpg-shell-tail.bash', 'w')
f.write(bash)
f.close()

f=open('tail/habitrpg-shell-tail.bat', 'w')
f.write(winbat)
f.close()


