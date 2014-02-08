//
//  MainPageViewController.h
//  RedditBrowser
//
//  Created by Alex on 08/02/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPageViewController : UIViewController <NSURLConnectionDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *theTableView;
@property (strong, nonatomic) NSMutableArray *titleCollection;

@end
