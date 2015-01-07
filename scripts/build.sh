#!/bin/sh
# 
#   build.sh
#   CodeMash
# 
#   Created by Shane Zatezalo  on 2013-11-07
#   Copyright (c) 2012-2015 Lottadot LLC. All rights reserved.
#
#	@brief Builds CodeMash with default Target.

set -x
# do not exit immediately on non-zero return values
set +e
set -o verbose

export WORKSPACE="${PWD}"
export xcode_workspace="JiraLottadotTools.xcworkspace"
export xcode_buildtarget="JiraAuther"

xcrun xcodebuild -workspace "${xcode_workspace}" \
 -scheme "${xcode_buildtarget}" \
 -config Debug -sdk iphonesimulator clean build
