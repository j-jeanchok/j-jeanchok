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
