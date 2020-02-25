# coding=utf-8
import GPUtil
import time
import psutil

stopped_num = 10000000  
delay = 10  
Gpus = GPUtil.getGPUs()


def get_gpu_info():
    '''
    :return:
    '''
    gpulist = []
    GPUtil.showUtilization()

    for gpu in Gpus:
        print('gpu.id:', gpu.id)
        print('Total GPU：', gpu.memoryTotal)
        print('GPU usage：', gpu.memoryUsed)
        print('gpu Util percentage:', gpu.memoryUtil * 100)
        gpulist.append([gpu.id, gpu.memoryTotal, gpu.memoryUsed, gpu.memoryUtil * 100])

    return gpulist


def get_cpu_info():
    ''' :return:
    memtotal
    memfree
    memused: Linux: total - free
    mempercent
    cpu
    '''
    mem = psutil.virtual_memory()
    memtotal = mem.total
    memfree = mem.free
    mempercent = mem.percent
    memused = mem.used
    cpu = psutil.cpu_percent(percpu=True)

    return memtotal, memfree, memused, mempercent, cpu

def main():
    times = 0
    while True:
        if times < stopped_num:
            time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
            cpu_info = get_cpu_info()
            gpu_info = get_gpu_info()
            print(cpu_info)
            print(gpu_info, '\n')
            time.sleep(delay)
            times += 1
        else:
            break


if __name__ == '__main__':
    main()
