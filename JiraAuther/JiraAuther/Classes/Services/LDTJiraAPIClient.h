//
//  LDTJiraAPIClient.h
//  JiraAPIClient
//
//  Created by Shane Zatezalo on 12/28/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@class JIRIssues;

@interface LDTJiraAPIClient : AFHTTPSessionManager

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

+ (LDTJiraAPIClient *)sharedClient;

- (void)authenticate:(void (^)(BOOL success, NSError *error))block;

- (void)projectsWithBlock:(void (^)(NSArray *projects, NSError *error))block;

- (void)issuesForProjectKey:(NSString *)projectKey withBlock:(void (^)(JIRIssues *issues, NSError *error))block;

@end
