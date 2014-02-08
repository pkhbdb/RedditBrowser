//
//  RedditItem.h
//  RedditBrowser
//
//  Created by Alex on 06/02/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditItem : NSObject

// some kind of id ?
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *link; // NSURL ?
// GUID ?
@property (strong, nonatomic) NSDate *pubDate;
@property (strong, nonatomic) NSString *description;

- (RedditItem *)initWithTitle:(NSString *)title link:(NSString *)link pubDate:(NSString *)pubDateString description:(NSString *)description;

@end
