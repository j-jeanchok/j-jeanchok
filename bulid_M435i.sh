####m435i的驱动 Ubuntu22.04  不适用于Ubuntu20 最新的realsense驱动与ros1的 ros_realsense功能包冲突
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
#如果出现key添加失败就在/etc/apt/sources.list 和/etc/apt/sources.list.d里删除对应地址
sudo apt-get update
sudo apt-get install software-properties-common

sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u

# 安装各种包：librealsense2-dkms是一个具有动态内核模块支持(DKMS)功能的Linux驱动包。
# 没有集成到内核之中的Linux驱动程序需要手动编译，如果遇到因为发行版更新造成的内核版本的变动，由于Linux模块依赖于内核，之前编译的模块无法继续使用，只能重新编译。
# 而DKMS可以维护内核外驱动程序，内核版本变动后能自动生成新的模块。
# librealsense2-utils提供了示例和工具。
# librealsense2-dev和librealsense2-dbg是开发包和调试包，如果需要通过API去读取realsense的数据，就得安装这两个包。
sudo apt-get install librealsense2-dkms
sudo apt-get install librealsense2-utils
sudo apt-get install librealsense2-dev
sudo apt-get install librealsense2-dbg

#调用python api需要导入的库
pip install pyrealsense2 opencv-python

# 删除所有安装包，可执行
# dpkg -l | grep "realsense" | cut -d " " -f 3 | xargs sudo dpkg --purge

#参考链接
# https://blog.csdn.net/outbreakrmb/article/details/127520447
# https://zhuanlan.zhihu.com/p/371410573
