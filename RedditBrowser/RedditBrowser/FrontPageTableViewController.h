//
//  FrontPageTableViewController.h
//  RedditBrowser
//
//  Created by Alex on 06/02/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedditRequest.h"

@interface FrontPageTableViewController : UITableViewController <NSURLConnectionDelegate, RedditRequestDelegate>

@property (strong, nonatomic) NSMutableArray *titleCollection;
@property (strong, nonatomic) NSString *subredditName;

@end
