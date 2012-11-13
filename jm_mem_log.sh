#!/bin/sh
# http://jmnote.com/wiki/linux_actual_memory_usage
MEM_TOTAL=`free | grep ^Mem | awk '{print $2}'`
MEM_FREE1=`free | grep ^Mem | awk '{print $4}'`
MEM_FREE2=`free | grep ^-/+ | awk '{print $4}'`
MEM_NOMINAL=`echo "100-(100*$MEM_FREE1/$MEM_TOTAL)" | bc -l`
MEM_ACTUAL=`echo "100-(100*$MEM_FREE2/$MEM_TOTAL)" | bc -l`
echo `date +%Y-%m-%d\ %H:%M:%S` NOMINAL=${MEM_NOMINAL:0:5}% ACTUAL=${MEM_ACTUAL:0:5}% >> /root/my_mem_log.log
