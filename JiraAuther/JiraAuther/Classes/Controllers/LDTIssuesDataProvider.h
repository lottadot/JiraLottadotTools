//
//  LDTIssuesDataProvider.h
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/27/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

@import Foundation;

#import "LDTGenericTableDataProvider.h"

@class JIRIssue, JIRProject;

@interface LDTIssuesDataProvider : LDTGenericTableDataProvider

- (instancetype)initWithProject:(JIRProject *)project;

@end
