//
//  RedditItem.m
//  RedditBrowser
//
//  Created by Alex on 06/02/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "RedditItem.h"

@implementation RedditItem

@synthesize title, link, pubDate, description;

- (RedditItem *)initWithTitle:(NSString *)theTitle link:(NSString *)theLink pubDate:(NSString *)pubDateString description:(NSString *)theDescription
{
    self.title = theTitle;
    self.link = theLink;
    self.pubDate = nil; // todo : convert NSString to NSDate
    self.description = theDescription;
    
    return self;
}

@end
