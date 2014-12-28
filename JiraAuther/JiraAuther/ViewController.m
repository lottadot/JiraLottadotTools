//
//  ViewController.m
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/26/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "ViewController.h"
//#import "AFNetworking.h"
//#import "AFHTTPRequestOperationManager.h"
//#import "AFHTTPRequestOperation.h"
//#import "AFURLRequestSerialization.h"
//#import "AFHTTPRequestSerializer+OAuth2.h"
//#import "AFOAuth2Manager.h"

#import "JIRModels.h"

#import "LDTProjectsViewController.h"
#import "LDTProjectsDataProvider.h"

#import "LDTJiraAPIClient.h"

#define kJiraAutherServiceProviderIdentifier @"JiraAutherServiceProviderIdentifier"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIButton *authenticateButton;
@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UILabel *passwordLabel;

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@property (nonatomic, strong) LDTProjectsViewController *projectsViewController;

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
    [[LDTJiraAPIClient sharedClient] setUsername:self.usernameTextField.text];
    [[LDTJiraAPIClient sharedClient] setPassword:self.passwordTextField.text];

    [self authenticate];
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

#pragma mark - Authentication

- (void)authenticate
{
    [[LDTJiraAPIClient sharedClient] authenticate:^(BOOL success, NSError *error) {
        
        if (success) {
            
            [self getProjects];
            
        } else {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"login failed"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"ok"
                                                  otherButtonTitles:nil];
            [alert show];
            
        }
    }];
}

#pragma mark - Projects

- (void)getProjects
{
    [[LDTJiraAPIClient sharedClient] projectsWithBlock:^(NSArray *projects, NSError *error) {
        
        if (nil != projects) {
            
            [self displayProjects:projects];
            
        } else {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"problem"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"ok"
                                                  otherButtonTitles:nil];
            [alert show];
            
        }
    }];
}

- (void)displayProjects:(NSArray *)projects
{
    NSParameterAssert(projects);
    
    NSAssert(nil != self.navigationController, @"NavController is nil");
                     
    if (nil != projects) {
        
        LDTProjectsDataProvider *dataProvider = [LDTProjectsDataProvider new];
        [dataProvider setItems:projects];
        
        [[self projectsViewController] setDataProvider:dataProvider];
        
        NSAssert(nil != _projectsViewController, @"ViewController is empty");
        [self.navigationController showViewController:_projectsViewController sender:nil];
    }
}

- (LDTProjectsViewController *)projectsViewController
{
    if (nil == _projectsViewController) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        NSAssert(nil != storyboard, nil);
        
        LDTProjectsViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ProjectsViewController"];
        NSAssert(nil != viewController, @"viewcontroller is nil");
        
        _projectsViewController = viewController;
    }
    return _projectsViewController;
}

@end
