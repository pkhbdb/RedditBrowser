//
//  FrontPageTableViewController.h
//  RedditBrowser
//
//  Created by Alex on 06/02/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrontPageTableViewController : UITableViewController <NSURLConnectionDelegate>

@property (strong, nonatomic) NSMutableData *mutableData;
@property (strong, nonatomic) NSMutableArray *titleCollection;

@end
