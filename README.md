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
gem install jira-ruby

brew install xctool
brew tap atlassian/tap
brew install hg
brew install atlassian-plugin-sdk

emacs ~/.bash_profile
export JAVA_HOME=$(/usr/libexec/java_home)

````

### Setup the Jira Development Instance

#### Fire Jira up

````
atlas-run-standalone --product jira
````

Use admin:admin to login.

#### Configure Jira

1. Create a test project [http://localhost:2990/jira](http://localhost:2990/jira), call it "TestProject1". Depending on the type of project you choose to create, you may have the option to provide it a 'key'. If so, set that as "TP1".
3. Create an issue [http://localhost:2990/jira/secure/CreateIssue!default.jspa](http://localhost:2990/jira/secure/CreateIssue!default.jspa) in that project, call it "TestIssue1".
4. Create a new user [http://localhost:2990/jira/secure/admin/user/UserBrowser.jspa](http://localhost:2990/jira/secure/admin/user/UserBrowser.jspa) with username "Lottadot" and password "password". Edit the project you created and add this user to the project permissions.
5. Configure Jira to enable Basic Authentication, via "Application Links" on the admin screen [http://localhost:2990/jira/plugins/servlet/applinks/listApplicationLinks](http://localhost:2990/jira/plugins/servlet/applinks/listApplicationLinks). Use bogus URL's, since this isn't a web-app that's wanting to authenticate, it's an iOS app.

![image](Assets/jiraAutherAppLinkCreationScreenshot1.png =600x300)
![image](Assets/jiraAutherAppLinkCreationScreenshot3.png =600x300)
![image](Assets/jiraAutherAppLinkCreationScreenshot4.png =600x200)
![image](Assets/jiraAutherAppLinkCreationScreenshot5.png =600x500)

### Setup the iOS App

#### Configure the iOS app.

Open the Xcode Workspace. Shift-Command-F and locate the following strings:

1. LDTJiraAuthenticationTestsValidUsername
2. LDTJiraAuthenticationTestsValidPassword
3. LDTJiraAPIClientBaseURLString

replace the values in each for the user, password, and jira configuration you created in the prior steps.

## Run the iOS app.

Open the Xcode workspace. 

Build and run the app in the iPhone simulator. Login with the account. You should see your project, and your issue.

Quit that run, select the JiraAutherAcceptanceTests build scheme and run it's tests (command-U).

## Presentation

[Download the presentation](https://speakerdeck.com/lottadot/automated-testing-and-processes-for-your-ios-agile-team-codemash-2-dot-0-1-dot-5)
