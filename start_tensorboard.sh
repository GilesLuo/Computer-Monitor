#!/bin/bash

top -n 1 | head -n 10 | tail -n 3 > ~/bin/top.out

killall tensorboard >/dev/null 2>/dev/null
#tensorboard --logdir /home/marmot/Zhiyao-SafePlace/distributedRL_MAPF >/dev/null 2>/dev/null &
tensorboard --port 7007 --logdir /home/marmot/Zhiyao-SafePlace/communication/distributedRL_MAPF >/dev/null 2>/dev/null &

#tensorboard --port 8008 --logdir /home/marmot/Guillaume-SafePlace/ >/dev/null 2>/dev/null &
