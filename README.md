[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## C++/Google Test sample for demonstrating Testspace

Sample demonstrates techniques for using Testspace with C++ code and the [Google Test framework](https://code.google.com/p/googletest).

***
Using Multiple Online CI Services:

[![Build Status](https://travis-ci.org/testspace-samples/cpp.googletest.svg?branch=master)](https://travis-ci.org/testspace-samples/cpp.googletest)
[![Run Status](https://api.shippable.com/projects/570008739d043da07b099664/badge?branch=master)](https://app.shippable.com/projects/570008739d043da07b099664)


***
Publishing **Test Content** using www.testspace.com.

[![Space Health](https://samples.testspace.com/projects/123/spaces/452/badge)](https://samples.testspace.com/projects/123/spaces/452 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/123/spaces/452/metrics/289/badge)](https://samples.testspace.com/spaces/452/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](https://samples.testspace.com/projects/123/spaces/452/metrics/288/badge)](https://samples.testspace.com/spaces/452/schema/Code%20Coverage "Code Coverage (branches)")


***

Build Examples provided by the Google Test framework:

<pre>
cd gtest/build
make
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
gcovr --root gtest --filter ".*/samples/.*" --exclude ".*_unittest.*" -x -o build/coverage.xml
</pre>

Publish **`test results`** along with **`code coverage`**

<pre>
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
cd gtest/build
testspace [Tests]sample*.xml build/coverage.xml $TESTSPACE_TOKEN/$BRANCH_NAME
</pre>

Checkout the [Space](https://samples.testspace.com/projects/cpp.googletest). 

***

To replicate this sample: 
  - Account at www.testspace.com.
  - CI Environment Variable called **TESTSPACE_TOKEN** required:
    -  `TESTSPACE_TOKEN` = `credentials@my-org-name.testspace.com/my-project`
    - `credentials` set to `username:password` or your [access token](http://help.testspace.com/using-your-organization:user-settings).
    - `my-org-name.testspace.com/my-project` based on your *subdomain* and *project* names. Refer [here](http://help.testspace.com/reference:runner-reference#login-credentials) for more details. 
  