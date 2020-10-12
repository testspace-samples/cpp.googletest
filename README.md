[![Testspace](https://www.testspace.com/img/Testspace.png)](https://www.testspace.com)

***

## C++/Google Test sample for demonstrating Testspace

Sample demonstrates techniques for using Testspace with C++ code and the [Google Test framework](https://github.com/google/googletest).
  * Using a Testspace Project that is `connected` with this GitHub Repo
  * Using 3 Online CI services for demonstration purposes only
  * Can review the Results at [testspace-samples:cpp.cpputest](https://samples.testspace.com/projects/testspace-samples:cpp.googletest)  
  * Refer to our [Help](https://help.testspace.com/) for more information

***
Using Multiple Online CI Services:

![Build](https://github.com/testspace-samples/cpp.googletest/workflows/Build/badge.svg)
[![Build Status](https://travis-ci.org/testspace-samples/cpp.googletest.svg?branch=master)](https://travis-ci.org/testspace-samples/cpp.googletest)
[![CircleCI](https://circleci.com/gh/testspace-samples/cpp.googletest.svg?style=svg)](https://circleci.com/gh/testspace-samples/cpp.googletest)


***
Publishing Results using www.testspace.com.

[![Space Health](https://samples.testspace.com/spaces/827/badge)](https://samples.testspace.com/spaces/827 "Test Cases")
[![Space Metric](https://samples.testspace.com/spaces/827/metrics/819/badge)](https://samples.testspace.com/spaces/827/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](https://samples.testspace.com/spaces/827/metrics/817/badge)](https://samples.testspace.com/spaces/827/schema/Static%20Analysis "Static Analysis (issues)")

***
Download and configure the Testspace client 

<pre>
mkdir -p $HOME/bin
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | tar -zxvf- -C $HOME/bin
testspace config url samples.testspace.com
</pre>

Build Examples provided by the Google Test framework:

<pre>
make -C $GTEST_ROOT/build |& tee build.log ; test ${PIPESTATUS[0]} -eq 0
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
gcovr --root ../ --filter ".*/samples/.*" --exclude ".*_unittest.*" -x -o coverage.xml
</pre>

Push Content using Testspace client 

<pre>
testspace build.log{lint} [Tests]sample*.xml coverage.xml
</pre> 
