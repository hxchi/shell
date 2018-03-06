#!bin/bash

# this shell used for auto install gcc 

rootfilename="root_v6.12.04"
pathinstall="/opt"

if [ `whoami` = "root" ];then
	echo "当前用户为root，可以执行次脚本。"
else
	echo "请在root用户下执行此脚本。"
	exit 1
fi

rm -f ${rootfilename}.source.tar.gz
wget http://root.cern.ch/download/${rootfilename}.source.tar.gz

if [ ! -f "${rootfilename}.source.tar.gz" ];then
	echo "文件 ${rootfilename}.source.tar.gz 未下载成功。"
	exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

vname=`expr $rootfilename | sed 's/_v//g' | sed 's/\.//'` # vname=root61204

buildname="build$vname"
tarfilename=`expr $rootfilename | sed 's/_v/-/g'` #tarfilename=root-6.12.04
tar xzvf ${rootfilename}.source.tar.gz 

mkdir $buildname
cd $buildname
cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/${vname} -Dall=ON ../$tarfilename
make -j$num
make install
cd ..
rm -rf ${buildname}
rm -rf ${tarfilename}

echo " 安装结束 "
echo " 请将 source ${pathinstall}/$vname/bin/thisroot.sh  添加进 .bashrc"