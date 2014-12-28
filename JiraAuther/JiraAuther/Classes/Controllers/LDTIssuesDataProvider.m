//
//  LDTIssuesDataProvider.m
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/27/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "LDTIssuesDataProvider.h"
#import "JIRModels.h"
#import "AFHTTPRequestOperationManager.h"

@implementation LDTIssuesDataProvider

- (instancetype)initWithProject:(JIRProject *)project
{
    NSParameterAssert(project);
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    if (nil != project) {
        // TODO
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *issueTableViewCellIdentifier = @"LDTIssueTableViewCellIdentifier";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:issueTableViewCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:issueTableViewCellIdentifier];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JIRIssue *issue = (JIRIssue *)[self.items objectAtIndex:indexPath.row];
    [[cell textLabel] setText:[issue key]];
}



@end
