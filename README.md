[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## C++/Google Test sample for demonstrating Testspace

Sample demonstrates techniques for using Testspace with C++ code and the [Google Test framework](https://code.google.com/p/googletest).

***

[![Build Status](https://travis-ci.org/testspace-samples/cpp.googletest.svg?branch=master)](https://travis-ci.org/testspace-samples/cpp.googletest)
[![Space Health](https://samples.testspace.com/projects/84/spaces/285/badge)](https://samples.testspace.com/projects/84/spaces/285 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/84/spaces/285/metrics/179/badge)](https://samples.testspace.com/projects/84/spaces/285/metrics#metric-179 "Line/Statement Coverage")

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
./sample19_unittest --gtest_output=xml:sample10.xml
gcovr --root gtest --filter ".*samples.*" --exclude ".*_unittest.*" -x -o ../build/coverage.xml
</pre>

Publish **`test results`** along with **`code coverage`**

<pre>
testspace publish [Tests]sample*.xml coverage.xml
</pre>

Checkout the [Space](https://samples.testspace.com/projects/cpp/spaces/googletest). 

***

To fork this example using Travis requires:
  - Create an account at www.testspace.com
  - Travis Environment Variables:
    - `TESTSPACE_USER_TOKEN` set to the `value` defined as your [Access token](http://help.testspace.com/using-your-organization:user-settings).
    - `TESTSPACE_URL` set to `my-org-name.testspace.com/my-project/my-space`. Refer [here](http://help.testspace.com/reference:runner-reference#config) for more details. This example uses `samples.testspace.com/cpp/googletest`.
