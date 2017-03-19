//
//  PBSNetworkOperation.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSNetworkOperation.h"

#import "PBSResponseCache.h"
#import "PBSNetworkClient.h"
#import "PBSCancelableOperation.h"

@interface PBSNetworkOperation ()

@property (nonatomic, strong) id<PBSNetworkClient> networkClient;
@property (nonatomic, strong) id<PBSCancelableOperation> currentOperation;

@end

@implementation PBSNetworkOperation

#pragma mark - Initialization

- (instancetype)initWithNetworkClient:(id<PBSNetworkClient>)networkClient {
    self = [super init];
    if (self) {
        _networkClient = networkClient;
    }
    return self;
}

+ (instancetype)operationWithNetworkClient:(id<PBSNetworkClient>)networkClient {
    return [[[self class] alloc] initWithNetworkClient:networkClient];
}

#pragma mark - Operation execution

- (void)main {
    
    [super main];
    
    if (self.request) {
        
        NSCachedURLResponse *cachedResponse = [self.cache responseRequest:self.request];
        
        if (cachedResponse) {
            self.completion(cachedResponse.data, (NSHTTPURLResponse *)cachedResponse.response, nil);
            [self completeOperation];
        } else {
            __weak typeof(self) weakSelf = self;
            PBSNetworkClientCompletionBlock completion = ^(NSData *data, NSHTTPURLResponse *response, NSError *error) {
                __strong typeof(self) strongSelf = weakSelf;
                
                if (error == nil) {
                    [strongSelf.cache cacheResponse:response data:data forRequest:strongSelf.request];
                }
                
                if ([strongSelf isCancelled]) {
                    return;
                }
                
                if (strongSelf.completion) {
                    strongSelf.completion(data, response, error);
                }
                [strongSelf completeOperation];
                
            };
            
            self.currentOperation = [self.networkClient sendRequest:self.request completionBlock:completion];
        }
        
    } else if (self.completionBlock) {
        self.completion(nil, nil, nil);
        [self completeOperation];
    }
}

- (void)cancel {
    [self.currentOperation cancel];
    [super cancel];
}

@end
