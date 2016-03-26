#!/bin/bash
#解析ifconfig命令的标准输出，返回一个hash。key是网卡名称 value是对应的ip。

#得到网卡的数量
i=`ifconfig|sed -n "/^eth[0-9]/p"|wc -l`

#声明数组array为关联数组hash
declare -A array

#进入循环，每次循环找到该网卡的ip地址，并作为关联数组array的值
for((j=0;j<i;j++))
do
array[eth$j]=`ifconfig eth$j |grep 'inet addr' |awk '{print $2}'\ |awk  -F  ":"  '{print $2}'`
done 

#遍历哈希数组array，输出其网卡及对应的值
for element in ${!array[*]}
do
 echo $element:${array[$element]}
done





