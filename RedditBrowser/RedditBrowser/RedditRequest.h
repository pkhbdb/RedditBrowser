//
//  RedditRequest.h
//  RedditBrowser
//
//  Created by Alex on 06/02/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

@protocol RedditRequestDelegate <NSObject>

@required

-(void)requestDidReceiveResultArray:(NSArray *)resultArray;

@end

#import <Foundation/Foundation.h>

@interface RedditRequest : NSObject <NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property (strong, nonatomic) NSMutableData *mutableData;
@property (strong, nonatomic) id<RedditRequestDelegate> delegate;

- (void)forgeRequestWithUrlString:(NSString *)urlString;

@end
