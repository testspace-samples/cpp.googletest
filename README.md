[![Testspace](http://www.testspace.com/img/Testspace.png)](http://www.testspace.com)

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

[![Space Health](https://samples.testspace.com/spaces/827/badge)](https://samples.testspace.com/spaces/827 "Test Cases")
[![Space Metric](https://samples.testspace.com/spaces/827/metrics/819/badge)](https://samples.testspace.com/spaces/827/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](https://samples.testspace.com/spaces/827/metrics/817/badge)](https://samples.testspace.com/spaces/827/schema/Static%20Analysis "Static Analysis (issues)")

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

Push Content using **Testspace client**: 

<pre>
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace @.testspace.txt $TESTSPACE_TOKEN/$GITHUB_ORG:$REPO_NAME/$BRANCH_NAME#$BUILD_NUMBER
</pre> 

Checkout the published [Test Content](https://samples.testspace.com/projects/testspace-samples:cpp.googletest). Note that the `.testspace.txt` file contains the [set of files](http://help.testspace.com/how-to:publish-content#publishing-via-content-list-file) to publish. 

***

To replicate this sample: 
  - Setup account at www.testspace.com.
  - Create a Environment variable called `TESTSPACE_TOKEN`
     - `TESTSPACE_TOKEN` = `credentials@Your-Org-Name.testspace.com`
     - `credentials` set to `username:password` or your [access token](http://help.testspace.com/reference:client-reference#login-credentials)
     - To [use Testspace with a CI system](http://help.testspace.com/how-to:add-to-ci-workflow), store `TESTSPACE_TOKEN` as a secure environment variable
 
