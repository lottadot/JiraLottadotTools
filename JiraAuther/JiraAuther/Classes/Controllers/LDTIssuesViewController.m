//
//  LDTIssuesViewController.m
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/27/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "LDTIssuesViewController.h"
#import "LDTIssuesDataProvider.h"

@interface LDTIssuesViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation LDTIssuesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setAccessibilityLabel:@"Issue List"];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] setDataSource:_dataProvider];
}

#pragma mark - iVars

- (void)setDataProvider:(LDTIssuesDataProvider *)dataProvider
{
    _dataProvider = dataProvider;
    [[self tableView] setDataSource:_dataProvider];
}

@end
