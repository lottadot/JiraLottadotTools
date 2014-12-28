//
//  LDTProjectsDataProvider.m
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/27/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import "LDTProjectsDataProvider.h"
#import "LDTGenericTableDataProvider.h"
#import "JIRModels.h"

@implementation LDTProjectsDataProvider

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *projectTableViewCellIdentifier = @"LDTProjectTableViewCellIdentifier";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:projectTableViewCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:projectTableViewCellIdentifier];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JIRProject *project = (JIRProject *)[self.items objectAtIndex:indexPath.row];
    [[cell textLabel] setText:[project name]];
}

@end
