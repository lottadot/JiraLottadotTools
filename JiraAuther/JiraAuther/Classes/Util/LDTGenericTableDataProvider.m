//
//  LDTGenericTableDataProvider.m
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/28/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "LDTGenericTableDataProvider.h"

@implementation LDTGenericTableDataProvider

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(NO, @"You must override when subclassing.");
    return nil;
}

@end
