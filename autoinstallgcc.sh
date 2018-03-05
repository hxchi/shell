#!bin/bash

# this shell used for auto install gcc 
# from why

gccfilename="gcc-4.9.2"

if [ `whoami` = "root" ];then
	echo "当前用户为root，可以执行次脚本。"
else
	echo "请在root用户下执行此脚本。"
	exit 1
fi

rm -f ${gccfilename}.tar.gz
wget http://mirrors.ustc.edu.cn/gnu/gcc/${gccfilename}/${gccfilename}.tar.gz

if [ ! -f "${gccfilename}.tar.gz" ];then
	echo "文件 ${gccfilename}.tar.gz 未下载成功。"
	exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar xzvf ${gccfilename}.tar.gz 
cd ${gccfilename}
echo "here..."
./contrib/download_prerequisites #自动编译下载所需文件
./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --enable-checking=release --enable-languages=c,c++,fortran --disable-multilib
make -j$num
make install
cd ..
rm -rf ${gccfilename}

