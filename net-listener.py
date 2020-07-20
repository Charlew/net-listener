import subprocess
import sys
import os

sys.stdout.write('Net listener has started\n')

IP_DEVICE = os.getenv("IP_DEVICE")

if IP_DEVICE == '' or IP_DEVICE is None:
    sys.stderr.write("Missing IP_DEVICE env variable! Exiting...")
    exit()

proc = subprocess.Popen(["ping", IP_DEVICE], stdout=subprocess.PIPE)
while True:
    line = proc.stdout.readline()
    if not line:
        break
    connected_ip = line.decode('utf-8').split()[3].replace(':', '')

    if connected_ip == IP_DEVICE:
        sys.stdout.write(connected_ip + " just connected to the network\n")
        sys.stdout.write("Exiting...\n")
        exit()
