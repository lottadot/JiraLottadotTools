//
//  LDTIssuesViewController.h
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/27/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LDTIssuesDataProvider;

@interface LDTIssuesViewController : UIViewController

@property (nonatomic, strong) IBOutlet LDTIssuesDataProvider *dataProvider;

@end
