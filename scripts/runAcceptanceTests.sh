#!/bin/sh
# 
#   runAcceptanceTests.sh
#   CodeMash
# 
#   Created by Shane Zatezalo  on 2013-11-07
#   Copyright (c) 2012-2015 Lottadot LLC. All rights reserved.
#
#	@brief Runs the Acceptance Tests.


set -x
# do not exit immediately on non-zero return values
set +e
set -o verbose

export WORKSPACE="${PWD}"
export xcode_workspace="JiraLottadotTools.xcworkspace"
export xcode_buildtarget="JiraAuther"

export KIF_SCREENSHOTS="${WORKSPACE}/FailedScreenshots"
export xcode_acceptancetestsscheme="JiraAutherAcceptanceTests"

if [ ! -d "test-reports" ]; then 
    mkdir "test-reports"
fi

echo "Running KIF Integration Tests:${WORKSPACE}"

xcrun xcodebuild -workspace "${xcode_workspace}" \
 -scheme "${xcode_acceptancetestsscheme}" \
 -destination 'platform=iOS Simulator,name=iPhone 5s,OS=8.1' \
 CONFIGURATION_BUILD_DIR="${WORKSPACE}/build" \
 CONFIGURATION_TEMP_DIR="${WORKSPACE}/build" \
 settings=GCC_TREAT_WARNINGS_AS_ERRORS=NO clean build test

