#!/bin/bash

# System prerequisites 
#sudo apt-get update
#sudo apt-get install wget unzip python make g++
#sudo apt-get install cmake
sudo pip install gcovr 

# Download framework
GTEST_ROOT=$PWD/googletest-release-1.8.0/googletest
rm -rf $PWD/googletest-release-1.8.0
wget https://github.com/google/googletest/archive/release-1.8.0.zip
unzip release-1.8.0.zip 
rm release-1.8.0.zip

# Build library
mkdir -p $GTEST_ROOT/build
pushd $GTEST_ROOT/build
cmake -Dgtest_build_samples=ON -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS_DEBUG='-g -fprofile-arcs -ftest-coverage' ../
make clean gtest
popd

# Build samples
rm -f build.log
# (i) building with coverage (ii) preserving STDOUT while saving to a log file (iii) preserving the original exit code
make -C $GTEST_ROOT/build |& tee build.log ; test ${PIPESTATUS[0]} -eq 0

# Analysis
# using the build.log

# Test
rm -f sample*.xml
$GTEST_ROOT/build/sample1_unittest --gtest_output=xml:sample1.xml
$GTEST_ROOT/build/sample2_unittest --gtest_output=xml:sample2.xml
$GTEST_ROOT/build/sample3_unittest --gtest_output=xml:sample3.xml
$GTEST_ROOT/build/sample4_unittest --gtest_output=xml:sample4.xml
$GTEST_ROOT/build/sample5_unittest --gtest_output=xml:sample5.xml
$GTEST_ROOT/build/sample6_unittest --gtest_output=xml:sample6.xml
$GTEST_ROOT/build/sample7_unittest --gtest_output=xml:sample7.xml
$GTEST_ROOT/build/sample8_unittest --gtest_output=xml:sample8.xml
$GTEST_ROOT/build/sample9_unittest --gtest_output=xml:sample9.xml
$GTEST_ROOT/build/sample10_unittest --gtest_output=xml:sample10.xml
rm -f coverage.xml
gcovr --root ./ --filter ".*/samples/.*" --exclude ".*_unittest.*" -x -o coverage.xml

# Push content

## Requires TESTSPACE_TOKEN = $ACCESS_TOKEN:@samples.testspace.com. 

BRANCH_NAME=`git symbolic-ref --short HEAD`
GIT_URL=`git remote show origin -n | grep Fetch\ URL: | sed 's/.*URL: //'`
REPO_SLUG=`echo ${GIT_URL#*github.com?} | sed 's/.git//'`

curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace @.testspace.txt $TESTSPACE_TOKEN/${REPO_SLUG/\//:}/${BRANCH_NAME}#c9.Build