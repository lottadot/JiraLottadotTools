//
//  LDTJiraAPIClient.h
//  JiraAPIClient
//
//  Created by Shane Zatezalo on 12/28/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@class JIRIssues;

/**
 The `LDTJiraAPIClient` is a class to communicate with the JIRA API. It uses Basic Authentication. It does not require SSL. You should not use this, as is, in a production setup, without using SSL. Or better, use OAuth.
 */
@interface LDTJiraAPIClient : AFHTTPSessionManager

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

+ (LDTJiraAPIClient *)sharedClient;

/**
 Authenticates the user.
 
 @requires You must define `username` and `password` before calling this method.
 */
- (void)authenticate:(void (^)(BOOL success, NSError *error))block;

/**
 Obtains the projects the authenticated user has access to.
 
 @required You must call `authenticate` before calling this method.
 */
- (void)projectsWithBlock:(void (^)(NSArray *projects, NSError *error))block;

/**
 Obtains ALL Issues for a Jira Project.
 
 @param projectkey `NSString` representing the KEY of a project. Required.
 
 @required You must call `authenticate` before using this method.
 */
- (void)issuesForProjectKey:(NSString *)projectKey withBlock:(void (^)(JIRIssues *issues, NSError *error))block;

@end
