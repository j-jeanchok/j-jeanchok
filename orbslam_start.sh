####启动orbslam3 的命令
./../Examples/RGB-D/rgbd_realsense_D435i ../Vocabulary/ORBvoc.txt ./../Examples/RGB-D/RealSense_D435i.yaml
###./Examples/RGB-D-Inertial/rgbd_inertial_realsense_D435i Vocabulary/ORBvoc.txt ./Examples/RGB-D-Inertial/RealSense_D435i.yaml
./../Examples/RGB-D-Inertial/rgbd_inertial_realsense_D435i ../Vocabulary/ORBvoc.txt ./../Examples/RGB-D-Inertial/RealSense_D435i.yaml

####用于标定的kalib容器的命令
rosrun kalibr kalibr_calibrate_cameras \
--bag /data/cam_calib.bag  \
--topics /usb_cam/image_raw_throttle \
--models pinhole-radtan \
--target /data/apri.yaml \
--show-extraction 

##安装orbslam3
sudo apt update

sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

##下面这个python2和libdc libjpeg已经没了需要下别的版本
# sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev libjasper-dev
###修改
sudo apt-get install python3-dev python3-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-dev libjpeg-dev

sudo apt-get install libglew-dev libboost-all-dev libssl-dev

sudo apt install libeigen3-dev

sudo apt-get install libpango-1.0-0
sudo apt update
sudo apt install libgtk-3-dev #第25行需要GTK3

# 链接opencv、eigen安装库
sudo ln -s  /usr/include/opencv4/opencv2/ /usr/include/
sudo ln -s /usr/include/eigen3/Eigen /usr/include/Eigen


###opencv
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

####用于pybind
######自己加的pybind 放入cmake中，pybind包放入thirdparty
pybind11_add_module(pyorb
        py_orb/NDArrayConverter.cpp py_orb/ORBSLAM3Wrapper.cpp)

target_link_libraries(pyorb 
        PRIVATE ${PROJECT_NAME}
)
target_include_directories(pyorb
        PRIVATE ${PROJECT_SOURCE_DIR}/py_orb
)
include_directories(
${PROJECT_SOURCE_DIR}
${PROJECT_SOURCE_DIR}/include
${PROJECT_SOURCE_DIR}/include/CameraModels
${PROJECT_SOURCE_DIR}/Thirdparty/Sophus
${PROJECT_SOURCE_DIR}/Thirdparty/pybind
${EIGEN3_INCLUDE_DIR}
${Pangolin_INCLUDE_DIRS}
${PCL_INCLUDE_DIRS}
)
add_subdirectory(Thirdparty/pybind11)


./Examples/RGB-D/rgbd_realsense_D435i Vocabulary/ORBvoc.txt ./Examples/RGB-D/RealSense_D435i.yaml
