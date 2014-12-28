//
//  LDTProjectsViewController.m
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/27/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "LDTProjectsViewController.h"
#import "LDTProjectsDataProvider.h"

#import "LDTIssuesDataProvider.h"
#import "LDTIssuesViewController.h"

#import "JIRModels.h"
#import "LDTJiraAPIClient.h"

@interface LDTProjectsViewController () <UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation LDTProjectsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] setDataSource:_dataProvider];
}

#pragma mark - iVars

- (void)setDataProvider:(LDTProjectsDataProvider *)dataProvider
{
    _dataProvider = dataProvider;
    [[self tableView] setDataSource:_dataProvider];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    __unused JIRProject *project = (JIRProject *)[[_dataProvider items] objectAtIndex:indexPath.row];
    [[self tableView] deselectRowAtIndexPath:indexPath animated:NO];
  
    [[LDTJiraAPIClient sharedClient] issuesForProjectKey:[project key] withBlock:^(JIRIssues *issues, NSError *error) {
       
        if (nil != issues) {
            
            [self displayJiraIssues:(JIRIssues *)issues forProject:project];
            
            
        } else {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"problem"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"ok"
                                                  otherButtonTitles:nil];
            [alert setAccessibilityLabel:@"IssuesFailed"];
            [alert show];
            
        }
        
    }];
}

#pragma mark - Issues

- (void)displayJiraIssues:(JIRIssues *)jiraIssues forProject:(JIRProject *)project
{
    NSParameterAssert(jiraIssues);
    NSParameterAssert(project);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSAssert(nil != storyboard, nil);
    
    LDTIssuesViewController *issuesViewController = [storyboard instantiateViewControllerWithIdentifier:@"IssuesViewController"];
    NSAssert(nil != issuesViewController, @"viewcontroller is nil");

    LDTIssuesDataProvider *dataProvider = [LDTIssuesDataProvider new];
    [issuesViewController setDataProvider:dataProvider];
    [dataProvider setItems:jiraIssues.issues];
    
    [self.navigationController showViewController:issuesViewController sender:nil];
}

@end
