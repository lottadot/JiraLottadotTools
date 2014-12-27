//
//  ViewController.m
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/26/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"
#import "AFURLRequestSerialization.h"
#import "AFHTTPRequestSerializer+OAuth2.h"
#import "AFOAuth2Manager.h"

#import "JIRModels.h"

#define kJiraAutherServiceProviderIdentifier @"JiraAutherServiceProviderIdentifier"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIButton *authenticateButton;
@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UILabel *passwordLabel;

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSAssert(nil != self.usernameTextField, nil);
    NSAssert(nil != self.passwordTextField, nil);
    NSAssert(nil != self.authenticateButton, nil);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUIForTextFieldChanges];
}

#pragma mark - Actions

- (IBAction)authenticateButtonTapped:(id)sender
{
    //[self fakeAuthenticationToObtainToken];
    [self authenticateViaBasicWithUsername:self.usernameTextField.text password:self.passwordTextField.text];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self updateUIForTextFieldChanges];
}

- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
   [self updateUIForTextFieldChanges];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self updateUIForTextFieldChanges];
}

#pragma mark - Logic

- (void)updateUIForTextFieldChanges
{
    [self.authenticateButton setEnabled:[self authenticateButtonShouldBeEnabled]];
}

- (BOOL)authenticateButtonShouldBeEnabled
{
    return ((self.usernameTextField.text.length > 2) && (self.passwordTextField.text.length > 2));
}

#pragma mark - Authenticate

/**
 Authenticates by Basic Auth, gets session info
 */
- (void)authenticateViaBasicWithUsername:(NSString *)username password:(NSString *)password
{
    NSParameterAssert(username);
    NSParameterAssert(password);
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]
                                              initWithBaseURL:[NSURL URLWithString:@"http://apoc.local:2990/jira"]];

    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:username password:password];

    // http://apoc.local:2990/jira/rest/auth/1/session
    
    
    __weak __typeof(self)weakSelf = self;
    [manager GET:@"rest/auth/1/session" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        if (nil != responseObject && operation.response.statusCode == 200) {
            
            NSLog(@"operation:%@", operation);
            NSLog(@"responseObject:%@", responseObject);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Success"
                                                                message:@"You are logged in. Congrats!"
                                                               delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                [alert setAccessibilityLabel:@"LoginSuccess"];
                [alert show];
                
            });
            
            JIRSession *session = [JIRSession instanceFromDictionary:responseObject];
            NSLog(@"session:%@", session);
            [strongSelf setUsername:username];
            [strongSelf setPassword:password];
            
            [strongSelf projects];
            
        } else {

            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed"
                                                                message:@"login failed. please try again"
                                                               delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
                [alert setAccessibilityLabel:@"LoginFailed"];
                [alert show];
                
            });

        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"error:%@", error);

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"problem" message:[error description] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }];
}

- (void)projects
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]
                                              initWithBaseURL:[NSURL URLWithString:@"http://apoc.local:2990/jira"]];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:[self username] password:[self password]];
    
    // http://apoc.local:2990/jira/rest/api/2/project
    
    __weak __typeof(self)weakSelf = self;
    [manager GET:@"rest/api/2/project" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        if (nil != responseObject && operation.response.statusCode == 200) {
            
            NSLog(@"operation:%@", operation);
            NSLog(@"responseObject:%@", responseObject);
            
            NSArray *projectDicts = (NSArray *)responseObject;
            
            NSMutableArray *projects = [NSMutableArray new];
            for (NSDictionary *projectdict in projectDicts) {
                JIRProject *project = [JIRProject instanceFromDictionary:projectdict];
                [projects addObject:project];
            }

            NSLog(@"projects:%@", projects);
        } 
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"error:%@", error);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"problem" message:[error description] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }];
}
    
- (void)authenticateViaOAuthWithUsername:(NSString *)username password:(NSString *)password
{
    NSParameterAssert(username);
    NSParameterAssert(password);
    
    if (nil != username && nil != password) {
        
        NSURL *baseURL = [NSURL URLWithString:@"http://apoc.local:2990/jira"];
        
        NSString *clientID     = @"jira-oauth-consumer";
        NSString *clientSecret = @"AuYhdv6nnNb5DUSbBS4mXXRrivsB1oJV";
        
        AFOAuth2Manager *OAuth2Manager =
        [[AFOAuth2Manager alloc] initWithBaseURL:baseURL
                                        clientID:clientID
                                          secret:clientSecret];
        
        [OAuth2Manager authenticateUsingOAuthWithURLString:@"plugins/servlet/oauth/authorize"
                                                  username:username
                                                  password:password
                                                     scope:@"email"
                                                   success:^(AFOAuthCredential *credential) {
                                                       NSLog(@"Token: %@", credential.accessToken);
                                                       
                                                       [AFOAuthCredential storeCredential:credential
                                                                           withIdentifier:kJiraAutherServiceProviderIdentifier];
                                                   }
                                                   failure:^(NSError *error) {
                                                       NSLog(@"Error: %@", error);
                                                   }];
        
    }
}

- (void)fakeAuthenticationToObtainToken
{
    AFOAuthCredential *credential = [AFOAuthCredential
                                     credentialWithOAuthToken:@"BGzdx82lyTxppuYay7tHdNBayGZBYbnM"
                                     tokenType:@"All"];
    
    [AFOAuthCredential storeCredential:credential
                        withIdentifier:kJiraAutherServiceProviderIdentifier];
    
    [self getSomething];
}

- (void)getSomething
{
    NSURL *baseURL = [NSURL URLWithString:@"http://apoc.local:2990/jira"];
    
    AFOAuthCredential *credential = [AFOAuthCredential
                                     retrieveCredentialWithIdentifier:kJiraAutherServiceProviderIdentifier];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]
                                              initWithBaseURL:baseURL];
    
    [manager.requestSerializer setAuthorizationHeaderFieldWithCredential:credential];
    
    [manager GET:@"rest/api/2/issue/TP-1"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"Success: %@", responseObject);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Failure: %@", error);
         }];
    
}

@end
