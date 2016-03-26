#!/bin/bash
#查找cpu使用情况，把记录追加到用户家日志目录下的cpu_info.log文件中
uptime >>/home/michael/log/cpu_info.log
iostat >>/home/michael/log/cpu_info.log
free >>/home/michael/log/cpu_info.log
i=`du -k /home/michael/log/cpu_info.log |awk 'print $1'`

#每个cpu_info.log文件大小为500k，如果cpu_info.log文件大小大于500k时就分割该日志

logs_path="/home/michael/log"
save_path="/home/michael/log_save_path_log"

if [ ! -d ${save_path_log} ]
then
 mkdir -p ${save_path_log}
fi

if [ $i -gt 500 ] then
mv ${logs_path}/cpu_info.log ${save_path}/cpu_info$(date+%Y%m%d%H).log
rm ${logs_path}/cpu_info.log
fi


