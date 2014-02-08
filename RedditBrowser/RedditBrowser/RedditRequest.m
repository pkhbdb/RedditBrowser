//
//  RedditRequest.m
//  RedditBrowser
//
//  Created by Alex on 06/02/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "RedditRequest.h"
#import "GDataXMLNode.h"
#import "RedditItem.h"

@implementation RedditRequest

@synthesize mutableData, delegate;





- (void)forgeRequestWithUrlString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.reddit.com%@.xml", urlString]];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    // todo : créer l'instance de connection dans l'appDelegate
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];
}


#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    mutableData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [mutableData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:mutableData
                                                           options:0 error:&error];
    
    NSArray *array = [[[doc.rootElement elementsForName:@"channel"] objectAtIndex:0] elementsForName:@"item"];
    
    NSMutableArray *itemCollection = [[NSMutableArray alloc] init];
    
    for (GDataXMLElement *item in array) {
        
        NSString *title = [[[item elementsForName:@"title"] objectAtIndex:0] stringValue];
        NSString *link = [[[item elementsForName:@"link"] objectAtIndex:0] stringValue];
        NSString *pubDate = [[[item elementsForName:@"pubDate"] objectAtIndex:0] stringValue];
        NSString *description = [[[item elementsForName:@"description"] objectAtIndex:0] stringValue];
        
        RedditItem *newRedditItem = [[RedditItem alloc] initWithTitle:title link:link pubDate:pubDate description:description];
        
        [itemCollection addObject:newRedditItem];
    }
    
    [self.delegate requestDidReceiveResultArray:itemCollection];
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
}

@end
