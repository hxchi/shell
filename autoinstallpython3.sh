#!/bin/bash

# auto install python3

python3filename="Python-3.6.4"

if [ `whoami` = "root" ];then
    echo "当前为root用户，可以执行此脚本。"
else
    echo "请在root用户下执行此脚本。"
    exit 1
fi

rm -f ${python3filename}.tgz
version=`expr $python3filename | sed 's/Python-//g'`
echo ${version}
wget https://www.python.org/ftp/python/${version}/${python3filename}.tgz

if [ ! -f "${python3filename}.tgz" ];then
    echo "文件未下载成功"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${python3filename}.tgz
cd ${python3filename}
./configure --prefix=/usr/python
make -j$num
make install
cd ..
rm -rf ${python3filename}
