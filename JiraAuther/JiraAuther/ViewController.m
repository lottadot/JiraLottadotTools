//
//  ViewController.m
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/26/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIButton *authenticateButton;
@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UILabel *passwordLabel;

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
    // TODO
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

@end
