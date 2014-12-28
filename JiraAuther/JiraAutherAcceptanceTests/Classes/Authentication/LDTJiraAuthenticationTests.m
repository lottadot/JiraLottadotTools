//
//  LDTJiraAuthenticationTests.m
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/28/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "KIF/KIF.h"

@class KIFTestCase;

@interface LDTJiraAuthenticationTests : KIFTestCase

@end

@implementation LDTJiraAuthenticationTests

/// Verifies the username & password textfields are shown.
- (void)test01ValidateInitialForm
{
    [tester waitForViewWithAccessibilityLabel:@"userNameTextField"];
    [tester waitForViewWithAccessibilityLabel:@"passwordTextField"];
    [tester waitForViewWithAccessibilityLabel:@"authenticateButton"];
    
    //[tester waitForAbsenceOfViewWithAccessibilityLabel:@"authenticateButton"];
}

/// Enters bogus username/password, submits, verifies alert is shown, dismisses alert
- (void)test02AuthenticateInvalid
{
    [tester clearTextFromAndThenEnterText:@"someome" intoViewWithAccessibilityLabel:@"userNameTextField"];
        [tester clearTextFromAndThenEnterText:@"password" intoViewWithAccessibilityLabel:@"passwordTextField"];
    [tester tapViewWithAccessibilityLabel:@"authenticateButton"];
    
    [tester waitForViewWithAccessibilityLabel:@"Login Failed"];
    
    [tester waitForTappableViewWithAccessibilityLabel:@"OK"];
    [tester tapViewWithAccessibilityLabel:@"OK"];
}

/// Enters bogus username/password, submits, verifies no is shown
- (void)test03AuthenticateValid
{
    [tester clearTextFromAndThenEnterText:@"lottadot" intoViewWithAccessibilityLabel:@"userNameTextField"];
    [tester clearTextFromAndThenEnterText:@"password" intoViewWithAccessibilityLabel:@"passwordTextField"];
    [tester tapViewWithAccessibilityLabel:@"authenticateButton"];
    
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Login Failed"];
}

/// Verifies the Project List is Shown
- (void)test04VerifyProjectListIsShown
{
    [tester waitForViewWithAccessibilityLabel:@"Project List"];
}

/// Verifies the Project List has the one known project
- (void)test05VerifyProjectKnownProject
{
    [tester waitForViewWithAccessibilityLabel:@"TestProject1"];
}

/// Verifies the Project list has the one known project and it's tappable
- (void)test06VerifyProjectKnownIsTappable
{
    [tester tapViewWithAccessibilityLabel:@"TestProject1"];
}

/// Verifies the Project's Issues are shown
- (void)test07VerifyProjectIssuesListIsShown
{
    [tester waitForViewWithAccessibilityLabel:@"Issue List"];
}

/// Verifies the Project's Issue shown
- (void)test08VerifyProjectIssueIsShownInList
{
    [tester waitForViewWithAccessibilityLabel:@"TP-1"];
}

@end
