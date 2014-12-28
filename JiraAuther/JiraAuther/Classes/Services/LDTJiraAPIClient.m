//
//  LDTJiraAPIClient.m
//  JiraAPIClient
//
//  Created by Shane Zatezalo on 12/28/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "LDTJiraAPIClient.h"
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperation.h"
#import "AFSecurityPolicy.h"
#import "JIRModels.h"

static NSString * const LDTJiraAPIClientBaseURLString = @"http://apoc.local:2990/jira";

@implementation LDTJiraAPIClient

+ (LDTJiraAPIClient *)sharedClient
{
    static LDTJiraAPIClient * _sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LDTJiraAPIClient alloc] initWithBaseURL:[NSURL URLWithString:LDTJiraAPIClientBaseURLString]];
        
        // SSL pinning. None. Because, security.
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.securityPolicy = securityPolicy;
    });
    
    return _sharedClient;
}

- (void)authenticate:(void (^)(BOOL success, NSError *error))block
{
    [LDTJiraAPIClient sharedClient].responseSerializer = [AFJSONResponseSerializer serializer];
    [LDTJiraAPIClient sharedClient].requestSerializer = [AFJSONRequestSerializer serializer];
    
    [[LDTJiraAPIClient sharedClient].requestSerializer setAuthorizationHeaderFieldWithUsername:[self username] password:[self password]];

    [[LDTJiraAPIClient sharedClient] GET:@"rest/auth/1/session" parameters:nil success:^(__unused NSURLSessionDataTask *task, id JSON) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSInteger statuscode = response.statusCode;
        
        if (statuscode == 200) {
            

            [[LDTJiraAPIClient sharedClient].requestSerializer setAuthorizationHeaderFieldWithUsername:[self username] password:[self password]];
            
            if (block) {
                block(YES, nil);
            }
            
        } else {
            
            if (block) {
                block(NO, nil);
            }
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (block) {
            block(NO, error);
        }
    }];
}

- (void)projectsWithBlock:(void (^)(NSArray *projects, NSError *error))block
{
    [LDTJiraAPIClient sharedClient].responseSerializer = [AFJSONResponseSerializer serializer];
    [LDTJiraAPIClient sharedClient].requestSerializer = [AFJSONRequestSerializer serializer];
    
    [[LDTJiraAPIClient sharedClient].requestSerializer setAuthorizationHeaderFieldWithUsername:[self username] password:[self password]];
    
    [[LDTJiraAPIClient sharedClient] GET:@"rest/api/2/project" parameters:nil success:^(__unused NSURLSessionDataTask *task, id JSON) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSInteger statuscode = response.statusCode;
                                     
        if (statuscode == 200) {
            
            NSArray *projectDicts = (NSArray *)JSON;
            
            NSMutableArray *projects = [NSMutableArray new];
            
            for (NSDictionary *projectdict in projectDicts) {
                
                JIRProject *project = [JIRProject instanceFromDictionary:projectdict];
                [projects addObject:project];
            }
            
            if (block) {
                block(projects, nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"error:%@", error);
        
        if (block) {
            block(nil, error);
        }
        
    }];
}

- (void)issuesForProjectKey:(NSString *)projectKey withBlock:(void (^)(JIRIssues *issues, NSError *error))block
{
    if (nil == projectKey) {
        block(nil, nil);
        return;
    }
    
    [LDTJiraAPIClient sharedClient].responseSerializer = [AFJSONResponseSerializer serializer];
    [LDTJiraAPIClient sharedClient].requestSerializer = [AFJSONRequestSerializer serializer];
    
    [[LDTJiraAPIClient sharedClient].requestSerializer setAuthorizationHeaderFieldWithUsername:[self username] password:[self password]];
    
    NSString *urlString = [NSString stringWithFormat:@"rest/api/2/search?jql=project=%@&maxResults=-1", projectKey];
    [[LDTJiraAPIClient sharedClient] GET:urlString parameters:nil success:^(__unused NSURLSessionDataTask *task, id JSON) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSInteger statuscode = response.statusCode;
                                     
        if (statuscode == 200) {
            
            NSDictionary *responseDict = (NSDictionary *)JSON;
            
            JIRIssues *jiraIssues = [JIRIssues instanceFromDictionary:responseDict];
            
            if (block) {
                block(jiraIssues, nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (block) {
            block(nil, error);
        }
    }];
}


@end
