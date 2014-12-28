//
//  LDTIssuesViewController.h
//  JiraAuther
//
//  Created by Shane Zatezalo on 12/27/14.
//  Copyright (c) 2014 Lottadot LLC. All rights reserved.
//

@import UIKit;

@class LDTIssuesDataProvider;

@interface LDTIssuesViewController : UIViewController

@property (nonatomic, strong) IBOutlet LDTIssuesDataProvider *dataProvider;

@end
