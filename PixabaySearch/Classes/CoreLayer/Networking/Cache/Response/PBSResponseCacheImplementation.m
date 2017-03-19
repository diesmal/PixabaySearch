//
//  PBSResponseCacheImplementation.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSResponseCacheImplementation.h"

@interface PBSResponseCacheImplementation()

@property (nonatomic, strong) NSURLCache *cache;

@end

@implementation PBSResponseCacheImplementation

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    NSUInteger cacheSizeMemory = 100*1024*1024; // 100 MB
    NSUInteger cacheSizeDisk = 100*1024*1024; // 100 MB
    self.cache = [[NSURLCache alloc] initWithMemoryCapacity:cacheSizeMemory diskCapacity:cacheSizeDisk diskPath:@"pbs_network_cache"];
}


#pragma mark - PBSResponseCache

- (void)cacheResponse:(NSURLResponse *)repsponse data:(NSData *)data forRequest:(NSURLRequest *)request; {
    NSCachedURLResponse *cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:repsponse data:data];
    
    [self.cache storeCachedResponse:cachedResponse forRequest:request];
}

- (NSCachedURLResponse *)responseRequest:(NSURLRequest *)request {
    return [self.cache cachedResponseForRequest:request];
}

@end
