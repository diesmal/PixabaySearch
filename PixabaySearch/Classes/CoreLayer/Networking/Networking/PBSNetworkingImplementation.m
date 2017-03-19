//
//  PBSNetworkingImplementation.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSCommonNetworkClient.h"
#import "PBSNetworkOperation.h"
#import "PBSResponseCacheImplementation.h"

#import "PBSNetworkingImplementation.h"

@interface PBSNetworkingImplementation ()

@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) id<PBSResponseCache> cache;
@end

@implementation PBSNetworkingImplementation

#pragma mark - Singleton Method

+ (id<PBSNetworking>)sharedNetworking {
    static PBSNetworkingImplementation *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.queue = [NSOperationQueue new];
    self.cache = [PBSResponseCacheImplementation new];
}

#pragma mark - PBSNetworking

- (NSOperation *)addRequest:(NSURLRequest *)request completion:(PBSNetworkClientCompletionBlock)completionBlock {
    return [self addRequest:request withSesion:nil completion:completionBlock];
}

- (NSOperation *)addRequest:(NSURLRequest *)request withSesion:(NSURLSession *)session completion:(PBSNetworkClientCompletionBlock)completionBlock {
    
    if (session == nil) session = [NSURLSession sharedSession];
    
    id<PBSNetworkClient> networkClient = [[PBSCommonNetworkClient alloc] initWithURLSession:session];
    PBSNetworkOperation *operation = [PBSNetworkOperation operationWithNetworkClient:networkClient];
    operation.request = request;
    operation.completion = completionBlock;
    operation.cache = self.cache;
    [self.queue addOperation:operation];
    
    return operation;
}


@end
