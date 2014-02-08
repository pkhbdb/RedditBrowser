//
//  AppDelegate.h
//  RedditBrowser
//
//  Created by Alex on 06/02/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "RedditRequest.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RedditRequest *redditRequest;

@end
