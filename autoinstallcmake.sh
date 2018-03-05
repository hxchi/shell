#!bin/bash

# this shell used for auto install camke 
# from why

cmakefilename="cmake-3.7.2"

if [ `whoami` = "root" ];then
	echo "当前用户为root，可以执行次脚本。"
else
	echo "请在root用户下执行此脚本。"
	exit 1
fi

rm -f ${cmakefilename}.tar.gz
vcmake=${cmakefilename%.*}
vcmake=`expr $vcmake | sed 's/cmake-/v/g'`
wget https://cmake.org/files/${vcmake}/${cmakefilename}.tar.gz

if [ ! -f "${cmakefilename}.tar.gz" ];then
	echo "文件 ${cmakefilename}.tar.gz 未下载成功。"
	exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar xzvf ${cmakefilename}.tar.gz
cd ${cmakefilename}
./configure --prefix=/usr
make -j$num
make install
cd ..
rm -rf ${cmakefilename}

