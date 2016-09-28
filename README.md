[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## C++/Google Test sample for demonstrating Testspace

Sample demonstrates techniques for using Testspace with C++ code and the [Google Test framework](https://code.google.com/p/googletest).

***
Using Multiple Online CI Services:

[![Build Status](https://travis-ci.org/testspace-samples/cpp.googletest.svg?branch=master)](https://travis-ci.org/testspace-samples/cpp.googletest)
[![CircleCI](https://circleci.com/gh/testspace-samples/cpp.googletest.svg?style=svg)](https://circleci.com/gh/testspace-samples/cpp.googletest)
[![Run Status](https://api.shippable.com/projects/570008739d043da07b099664/badge?branch=master)](https://app.shippable.com/projects/570008739d043da07b099664)


***
Publishing **Test Content** using www.testspace.com.

[![Space Health](https://samples.testspace.com/projects/123/spaces/452/badge)](https://samples.testspace.com/projects/123/spaces/452 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/123/spaces/452/metrics/289/badge)](https://samples.testspace.com/spaces/452/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](https://samples.testspace.com/projects/123/spaces/452/metrics/288/badge)](https://samples.testspace.com/spaces/452/schema/Code%20Coverage "Code Coverage (branches)")


***

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

Publish **`test results`** along with **`static analysis`** and **`code coverage`**

<pre>
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace build.log{issues} [Tests]sample*.xml build/coverage.xml $TESTSPACE_TOKEN/$BRANCH_NAME
</pre>

Checkout the [Space](https://samples.testspace.com/projects/cpp.googletest). 

***

To replicate this sample: 
  - Account at www.testspace.com.
  - CI Environment Variable called **TESTSPACE_TOKEN** required:
    -  `TESTSPACE_TOKEN` = `credentials@my-org-name.testspace.com/my-project`
    - `credentials` set to `username:password` or your [access token](http://help.testspace.com/reference:client-reference#login-credentials).
    - `my-org-name.testspace.com/my-project` based on your *organization* (subdomain) and *project* names.  
