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
  
    // TODO
}

#pragma mark - Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:@"IssuesViewController"]) {
        
        __unused NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        
        LDTIssuesViewController *issuesViewController = (LDTIssuesViewController *)segue.destinationViewController;
        NSAssert(nil != issuesViewController, @"issuesViewController is nil");
        
        LDTIssuesDataProvider *dataProvider = [LDTIssuesDataProvider new];
        [issuesViewController setDataProvider:dataProvider];

    }
}

@end
