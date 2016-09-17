#!/bin/bash

# System prerequisites 
sudo apt-get update
sudo apt-get install wget unzip python make g++
sudo apt-get install cmake
sudo pip install gcovr 

# Download framework
rm -rf gtest
wget https://github.com/google/googletest/archive/release-1.7.0.zip
unzip release-1.7.0.zip 
mv googletest-release-1.7.0 gtest
rm release-1.7.0.zip

# Build (i) library (ii) examples
cd gtest
mkdir build
cd build
cmake -Dgtest_build_samples=ON -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS_DEBUG='-g -fprofile-arcs -ftest-coverage' ../
make clean gtest 

make 

# Analysis


# Test
rm -rf sample*.xml

./sample1_unittest --gtest_output=xml:sample1.xml
./sample2_unittest --gtest_output=xml:sample2.xml
./sample3_unittest --gtest_output=xml:sample3.xml
./sample4_unittest --gtest_output=xml:sample4.xml
./sample5_unittest --gtest_output=xml:sample5.xml
./sample6_unittest --gtest_output=xml:sample6.xml
./sample7_unittest --gtest_output=xml:sample7.xml
./sample8_unittest --gtest_output=xml:sample8.xml
./sample9_unittest --gtest_output=xml:sample9.xml
./sample10_unittest --gtest_output=xml:sample10.xml

cd ..
gcovr --root $PWD --filter ".*/samples.*" --exclude ".*_unittest.*" -x -o build/coverage.xml


# Publish
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
cd build
testspace [Tests]sample*.xml coverage.xml master.c9