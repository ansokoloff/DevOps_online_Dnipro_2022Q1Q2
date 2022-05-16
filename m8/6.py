import psutil
import platform

uname = platform.uname()

print(f"System: {uname.system}")
print(f"Node Name: {uname.node}")
print(f"Release: {uname.release}")
print(f"Version: {uname.version}")
print(f"Machine: {uname.machine}")
print(f"Processor: {uname.processor}")
print(f"Memory :{psutil.virtual_memory().total/1024/1024/1024} Gb")
print("Number of cores in system", psutil.cpu_count())
print("Disk: ", psutil.disk_partitions()[1])
