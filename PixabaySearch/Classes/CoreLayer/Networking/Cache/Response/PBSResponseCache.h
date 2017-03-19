//
//  PBSResponseCache.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBSResponseCache <NSObject>

- (NSCachedURLResponse *)responseRequest:(NSURLRequest *)request;
- (void)cacheResponse:(NSURLResponse *)repsponse data:(NSData *)data forRequest:(NSURLRequest *)request;

@end
