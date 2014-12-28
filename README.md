Jira Lottadot Tools
======================

This is be a collection of Jira tools for my Xcode Developer/Agile/Acceptance Tests presentation at [CodeMash 2014](http://codemash.org/).

### Installation

```` 
git submodule update --init --recursive
````
### Requirements

* Xcode 6.1.1
* iOS8
* OSX
* Ruby
* Python
* Jenkins [http://jenkins-ci.org](http://jenkins-ci.org)
* Java OSX [Java SE Development Kit 8 Downloads](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* Homebrew [http://brew.sh](http://brew.sh)
* Emacs
* XCTool [https://github.com/facebook/xctool](https://github.com/facebook/xctool)

## Contents

* JiraLottadotTools.xcworkspace 
	* An Xcode Workspace containing the Objective-C application example. It demonstrates a simple UI, communication with [Atlassian's Jira](https://www.atlassian.com/software/jira) and Acceptance Tests via [KIF](https://github.com/kif-framework/KIF).

## Setup the Development Environment

````
brew install xctool
brew tap atlassian/tap
brew install hg
brew install atlassian-plugin-sdk

emacs ~/.bash_profile
export JAVA_HOME=$(/usr/libexec/java_home)

````

### Setup the Jira Development Instance

#### Fire it up

````
atlas-run-standalone --product jira
````

#### Configure it

1. Create a test project [http://localhost:2990/jira](http://localhost:2990/jira), call it "TestProject1". Depending on the type of project you choose to create, you may have the option to provide it a 'key'. If so, set that as "TP1".
3. Create an issue [http://localhost:2990/jira/secure/CreateIssue!default.jspa](http://localhost:2990/jira/secure/CreateIssue!default.jspa) in that project, call it "TestIssue1".
4. Create a new user [http://localhost:2990/jira/secure/admin/user/UserBrowser.jspa](http://localhost:2990/jira/secure/admin/user/UserBrowser.jspa) with username "Lottadot" and password "password".

## Run the app.

Open the Xcode workspace. 

Build and run the app in the iPhone simulator. Login with the account. You should see your project, and your issue.

Quit that run, select the JiraAutherAcceptanceTests build scheme and run it's tests (command-U).


