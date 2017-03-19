//
//  PBSCommonNetworkClient.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSCommonNetworkClient.h"

@interface PBSCommonNetworkClient ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation PBSCommonNetworkClient

#pragma mark - Initialization

- (instancetype)initWithURLSession:(NSURLSession *)session {
    self = [super init];
    if (self) {
        _session = session;
    }
    return self;
}

#pragma mark - PBSNetworkClient

- (id<PBSCancelableOperation>)sendRequest:(NSURLRequest *)request
                          completionBlock:(PBSNetworkClientCompletionBlock)block {
    NSAssert(request != nil, @"NSURLRequest should not be nil");
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (block) {
            NSHTTPURLResponse *serverResponse = nil;
            if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                serverResponse = (NSHTTPURLResponse *)response;
            }
            
            block(data, serverResponse, error);
        }
    }];
    
    [dataTask resume];
    
    return (id<PBSCancelableOperation>)dataTask;
}

@end
