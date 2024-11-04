#########orbslam3 配环境 主要用于cmake报错 Ubuntu22.04


sudo apt update

sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

##下面这个python2和libdc libjpeg已经没了需要下别的版本
# sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev libjasper-dev
###修改
sudo apt-get install python3-dev python3-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-dev libjpeg-dev

sudo apt-get install libglew-dev libboost-all-dev libssl-dev

sudo apt install libeigen3-dev

sudo apt update
sudo apt install libgtk-3-dev #第25行需要GTK3

###opencv
cd Dev
mkdir Dev && cd Dev
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 4.6.0
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=Release -D WITH_CUDA=OFF -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j 1
sudo make install
cd ..
cd ..

####安装Pangolin
cd Dev
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin 
mkdir build 
cd build 
cmake .. -D CMAKE_BUILD_TYPE=Release 
make -j 1 
sudo make install
cd ..
cd ..
##安装orbslam
git clone https://github.com/UZ-SLAMLab/ORB_SLAM3.git   
cd ORB_SLAM3
sed -i 's/++11/++14/g' CMakeLists.txt
chmod +x build.sh
./build.sh
