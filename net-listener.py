import subprocess

IP_DEVICE = ""

proc = subprocess.Popen(["ping", IP_DEVICE], stdout=subprocess.PIPE)
while True:
    line = proc.stdout.readline()
    if not line:
        break
    connected_ip = line.decode('utf-8').split()[3].replace(':', '')

    if connected_ip == IP_DEVICE:
        print(connected_ip + " just connected to the network")