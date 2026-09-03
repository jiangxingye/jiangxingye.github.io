---
title: "how to install os & install NVIDIA Driver"
date: 2019-09-11T10:16:49+08:00
lastmod: 2019-09-12T03:23:21+08:00
slug: "how to install os & install NVIDIA Driver"
categories: [it, server]
tags: [nvidia]
description: "how to install os & install NVIDIA Driver"
---
一.安装Ubuntu1.制作启动盘，选择启动盘启动，硬盘分区自己分，然后按步安装就行就行了。

二.修改主机名和root密码vim /etc/hostname 与vim /etc/hosts/(ip域名) sudo passwd root 三.网络配置vim /etc/network/interfaces 自动获取：

auton eno2 iface eno2 inet dhcp 设置静态地址：

auto eno2 iface eno2 inet static address **** netmask 255.255.255.0 gateway：***** 重启网络服务：

1.service network restart 2./etc/init.d/networking restart 3.ifdown / ifup 配置dns vim /etc/resolv.conf 四.NVIDIA驱动安装1.删除旧的驱动：

sudo apt-get purge nvidia* 2.关闭nouveau 查看属性 sudo ls -lh /etc/modprobe.d/blacklist.conf 修改属性 sudo chmod 666 /etc/modprobe.d/blacklist.conf 禁用：

vim /etc/modprobe.d/blacklist.conf 添加：

blacklist vga16fb blacklist nouveau blacklist rivafb blacklist rivatv blacklist nvidiafb options nouveau modeset=0——如果禁用不成功就加上这句，不行就重启 更新：

sudo update-initramfs -u 重启查看：

lsmod | grep nouveau 关闭图形界面：

init 3 或 sudo service lightdw stop 安装 ：

sudo chmod +x NVIDIA-Linux-x86_64-***run sudo sh NVIDIA-Linux-x86_64-xxx.run -no-x-check -no-nouveau-check -no-opengl-files或sudo ./NVIDIA-Linux-x86_64-xxx.run -no-x-check -no-nouveau-check -no-opengl-files(避免出现循环登录) 安装gcc g++ make（不然可能报错） apt-get install gcc apt-get install g++ apt-get install make 查看:

nvidia-smi或nvidia-settings 卸载：

sudo sh ~/NVIDIA-Linux-x86_64-**.run –uninstall 驱动安装启动不了界面问题解决：

把/etc/lightdm/lightdm.conf备份 把/etc/x11/下面的xorg.conf.failsafe文件复制成xorg.conf 关闭集显 五.安装cuda9.1及cudnn7——关闭NetworkManager（不然重启可能进不去命令行）下载runfile文件 关闭图形界面 验证系统是否安装了kernel header和 package development uname -rsudo apt-get install linux-headers-$(uname -r)——可省略的操作 安装：

sudo sh cuda_9.1.85_387.26_linux.run 配置环境：

vim /etc/profile export PATH=/usr/local/cuda-9.1/bin:$PATH export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64:$LD_LIBRARY_PATH 不行的话试试：

vim ~/.bashrc $ export PATH=/usr/local/cuda-9.1/bin${PATH:+:{PATH}}$ export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64${LD_LIBRARY_PATH:+:{LD_LIBRARY_PATH}} vim /etc/p rofile export PATH=/usr/local/cuda-9.1/bin:$PATH 链接文件：

vim /etc/ld.so.conf.d/cuda.conf /usr/local/cuda/lib64 sudo lsconfig .查看：

nvcc –version cudnn安装——和cuda一个路径 tar -zxvf ** cd cuda/ sudo cp lib64/libcudnn* /usr/local/cuda-9.1/lib64/ sudo cp include/cudnn.h /usr/local/cuda-9.1/include/ 更新网络连接：

cd /usr/local/cuda-9.1/lib64/ chmod +r libcudnn.so.7.1.1 ——主要看版本 sudo ln -sf libcudnn.so.7.1.1 libcudnn.so.7 sudo ln -sf libcudnn.so.7 libcudnn.so 链接文件：

vim /etc/ld.so.conf.d/cuda.conf /usr/local/cuda-9.1/lib64 查看成功安装与否:ls /usr/local/cuda-9.0/lib64/libcudnn* sudo ldconfig 六.安装docker——一定要跟更新apt-get更新apt-get apt-get update 通过HTTP使用存储库：

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common——可不用加 添加密钥 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 设置stable存储库 sudo add-apt-repository “deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable” 在更新：

sudo apt-get update 安装最新的docker社区版 sudo apt-get install -y docker-ce 测试：

sudo docker run hello-world 列出可用的版本：

$ apt-cache madison docker-ce 下载nvidia-docker源文件：

wget https://github.com/nvidia/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd.deb https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb ——注：如果下载不了就用优盘拷贝进去 安装nvidia-docker dpck -i nvidia-docker*.deb 验证：

systemctl start docker或 service docker start docker images docker –version docker run hello-world 七.caffe安装依赖库安装：

sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler libgflags-dev libgoogle-glog-dev liblmdb-dev libatlas-base-dev git sudo apt-get install –no-install-recommends libboost-all-dev 如果不行可加上这些依赖项：（cmake build-essential libopenblas-dev liblapack-dev） 安装NCCL：

git clone https://github.com/NVIDIA/nccl.git cd nccl sudo make install -j8 安装caffe：

wget https://github.com/NVIDIA/caffe/archive/v0.15.9.tar.gz /opt tar zxvf v0.15.9.tar.g z cd caffe-0.15.9 cp Makefile,config.example Makefile.config vim Makefile.config 取消 USE_CUDNN:=1的注释和取消USE_NCCL:=1的注释 编译：

make all -j12 出现问题：

1.找不到目录caffe hdf5 解决：vim Makefile.config 85行：INCLUDE_DIRS 后面添加 /usr/include/hdf5/serial/ vim Makefile 173行：

LIBRARIES+=中的hdf5_hl和hdf5改为hdf5_serial_hl和hdf5_serial 2.Unsupport***“compute 20“ 解决：因为安装的是cuda9.1所以vim Makefile.config中CUDA_ARCH 删除20和21结尾的两行 测试：

sudo make runtest -j8 验证：

/build/tools***** 最后把caffe的环境变量加入到etc profile vim /etc/profile eaport PATH= /opt/caffe-0.15.9/build/tools :$PATH cudnn.hpp问题：

因为当前版本的caffe的cudnn实现与系统所安装的cudnn的版本不一致引起的。

解决办法：

1.将./include/caffe/util/cudnn.hpp 换成最新版的caffe里的cudnn的实现，即相应的cudnn.hpp. \2. 将./include/caffe/layers里的，所有以cudnn开头的文件，例cudnn_conv_layer.hpp。

都替换成最新版的c affe里的相应的同名文件。

3.将./src/caffe/layer里的，所有以cudnn开头的文件，例如cudnn_lrn_layer.cu，cudnn_pooling_layer.cpp，cudnn_sigmoid_layer.cu。都替换成最新版的caffe里的相应的同名文件。

https://blog.csdn.net/u014696921/article/details/56014899 编译错误：

.build_release/examples/siamese/convert_mnist_siamese_data.bin 解决方法：

首先这个问题确实是opencv的问题，只需要把 Makefile.config里的 #USE_PKG_CONFIG := 这一行前面的#给去掉，然后在他下一行添加 LIBRARIES += glog gflags protobuf leveldb snappy \ ​ lmdb boost_system hdf5_hl hdf5 m \ ​ opencv_core opencv_highgui opencv_imgproc opencv_imgcodecs 保存，然后再编译即可。如果还不可以，试一下把原来的编译内容用make clean清空，再重新编译。如果还不行，那只能靠诸位再继续大胆尝试了。

八.安装Anaconda应用软件安装在/opt目录下：

bash Anaconda……………….. 添加环境：export PATH=………..：/opt/anaconda3/bin:$PATH source /etc/profile 验证:

conda list 配置好PATH后，可以通过which conda或conda –version命令检查是否正确。

输入conda list 就可以查询，你现在安装了哪些库，常用的numpy, scipy名列其中。如果你还有什么包没有安装上，可以运行conda install * 来进行安装， 如果某个包版本不是最新的，运行 conda update * 就可以了。

九.安装tensorflow——目前只有cuda9.0可以匹配tensorflow1.8和1.9，cuda9.1版本太高安装：pip –default-timeout=100 install -U tensorflow***** 如果没有pip执行:

apt-get install python-pip 验证：

1.python 2.import tensorflow 3.import tensorflow as if 4.a = tf.constant(’hello world’) with tf.Session () as sess:

两个空格–print（sess.run(a)） Ubuntu18.04验证：

import tensorflow as tf hello =tf.constant(‘hello,world’)——创建常量 sess =tf.Session()——创建会话 result =sess.run(hello)——执行 sess.close()——关闭会话 print(result)——输出 十.安装VASP详见vsap篇 十一.安装torchpip –default-timeout=100 install torch torchvision 或：pip3 install torch torchvision 如果局限于网速则可以通whl文件离线安装 验证:

ipython import torch 或：import pytorch import torchvision
