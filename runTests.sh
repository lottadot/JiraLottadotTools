#!/bin/sh
# 
#   runTests.sh
#   CodeMash
# 
#   Created by Shane Zatezalo  on 2013-11-07
#   Copyright (c) 2012-2013 Lottadot LLC. All rights reserved.
#
#	@brief Runs the CodeMash Logic Tests for both 4.0 and 3.5 screen sizes.


set -x
# do not exit immediately on non-zero return values
set +e
set -o verbose

export WORKSPACE="${PWD}"
export xcode_workspace="CodeMashiOS.xcworkspace"
export xcode_testsscheme="CodeMash"

if [ ! -d "test-reports" ]; then 
    mkdir "test-reports"
fi

${WORKSPACE}/bin/reset_simulator >/dev/null 2>&1

xcrun xcodebuild test -workspace "${xcode_workspace}" \
 -scheme "${xcode_testsscheme}" \
 -config Debug -sdk iphonesimulator \
 -destination 'platform=iOS Simulator,name=iPhone Retina (4-inch),OS=7.0' \
 -arch i386 VALID_ARCHS=i386 \
 CONFIGURATION_BUILD_DIR=build \
 build | ${WORKSPACE}/bin/ocunit2junit

${WORKSPACE}/bin/reset_simulator >/dev/null 2>&1

xcrun xcodebuild test -workspace "${xcode_workspace}" \
 -scheme "${xcode_testsscheme}" \
 -config Debug -sdk iphonesimulator \
 -destination 'platform=iOS Simulator,name=iPhone Retina (3.5-inch),OS=7.0' \
 -arch i386 VALID_ARCHS=i386 \
 CONFIGURATION_BUILD_DIR=build \
 build
 

  
 
 


