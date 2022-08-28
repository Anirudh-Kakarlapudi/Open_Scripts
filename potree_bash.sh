#!/bin/bash
echo "Step 1/4 - Running an update"
sudo apt update && sudo apt upgrade -y
echo "Step 1/4 - Update Successful"
sleep 3

echo "Step 2/4 - Installing Dependencies" 
sudo apt install -y git libboost-all-dev build-essential cmake ccache
echo "Step 2/4 - Dependencies Installed"
sleep 3

echo "Step 3/4 - Installing Laszip"
git clone https://github.com/LASzip/LASzip.git
cd LASzip
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
sudo make && sudo make install
cd ../..
echo "Step 3/4 - Laszip Installed"
sleep 3

echo "Step 4/4 - Installing PotreeConverter-1.6"
wget https://github.com/potree/PotreeConverter/archive/refs/tags/1.6.zip
unzip 1.6.zip
cd PotreeConverter-1.6
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DLASZIP_INCLUDE_DIRS=/usr/include/laszip -DLASZIP_LIBRARY=/usr/lib/liblaszip.so -DCMAKE_INSTALL_PREFIX=/usr
sudo make && sudo make install
cd ../..
echo "Step 4/4 - Installed PotreeConverter-1.6"
echo "Usage: PotreeConverter <lasfile_path> -o <out_folder> -a RGB" 
