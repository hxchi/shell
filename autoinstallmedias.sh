#!bash/bin

# auto install medias

if [ `whoami` = "root" ];then
	echo "当前为root用户，可以执行。"
else
	echo "请在root用户下执行。"
fi

mkdir /Software
chmod 777 /Software
cd /Software

wget http://npg.dl.ac.uk/MIDAS/MIDAS_Release/MIDAS_base_220114.tar.gz
wget http://npg.dl.ac.uk/MIDAS/MIDAS_Release/MIDAS_bin_Linux64_220114.tar.gz
wget http://npg.dl.ac.uk/MIDAS/MIDAS_Release/MIDAS_Samples_070504.tar.gz
wget http://ns.ph.liv.ac.uk/Software/MTsort51.tar.gz

tar -zxvf MIDAS_base_220114.tar.gz
tar -zxvf MIDAS_bin_Linux64_220114.tar.gz
tar -zxvf MIDAS_Samples_070504.tar.gz
tar -zxvf MTsort51.tar.gz

mv  bin_Linux64 ./MIDAS_base_220114/.
mv  lib_Linux64 ./MIDAS_base_220114/.
mv  MTsort ./MIDAS_base_220114/.
mv  Samples ./MIDAS_base_220114/.

echo "请在终端执行  ln -s /Software/MIDAS_base_220114 /MIDAS"
echo "请退出root用户后 修改~/.bashrc文件"
echo "请在bashrc中添加 export PATH=/MIDAS/bin_Linux64:$PATH"
echo "请在bashrc中添加 export LD_LIBRARY_PATH=/MIDAS/lib_Linux64:$LD_LIBRARY_PATH"
echo "如果遇到csh不存在的问题，请执行sudo apt-get install csh"