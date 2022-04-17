from asyncio.subprocess import PIPE
import subprocess
import time


def wait_timeout(proc, seconds, start_time):
    """Wait for a process to finish, or raise exception after timeout"""
    end = start_time + seconds
    interval = min(seconds / 1000.0, .25)

    while True:
        result = proc.poll()
        if result is not None:
            return result
        if time.time() >= end:
            proc.kill()
        time.sleep(interval)


num_nodes = 400
subprocesses = []

for i in range(num_nodes):
    proc = subprocess.Popen(["python", "dgnca/run_nodes.py"])
    subprocesses.append(proc)

seconds = 180
start = time.time()
for subp in subprocesses:
    wait_timeout(subp, seconds=seconds, start_time=start)
