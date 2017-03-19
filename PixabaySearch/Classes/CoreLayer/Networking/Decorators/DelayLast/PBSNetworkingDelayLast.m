//
//  PBSNetworkingDelayLast.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSNetworkingSharedTypes.h"

#import "PBSNetworkingDelayLast.h"

static NSTimeInterval const kDefaultDelay = 1;

@interface PBSNetworkingDelayLast ()

@property (nonatomic, strong) id<PBSNetworking> superNetworking;
@property (nonatomic, strong) NSOperation *currentOpertation;
@property (nonatomic, strong) NSTimer *currentTimer;

@end

@implementation PBSNetworkingDelayLast

#pragma mark - Initialization

- (instancetype)initWithNetworking:(id<PBSNetworking>)networking {
    NSAssert(networking != nil, @"Networking should not be nil");
    if (self = [super init]) {
        self.superNetworking = networking;
        self.delay = kDefaultDelay;
    }
    return self;
}

#pragma mark - PBSNetworking

- (NSOperation *)addRequest:(NSURLRequest *)request completion:(PBSNetworkClientCompletionBlock)completionBlock {
    return [self addRequest:request withSesion:nil completion:completionBlock];
}

- (NSOperation *)addRequest:(NSURLRequest *)request withSesion:(NSURLSession *)session completion:(PBSNetworkClientCompletionBlock)completionBlock {
    
    __weak typeof(self) weakSelf = self;
    NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.superNetworking addRequest:request withSesion:session completion:completionBlock];
    }];
    
    if (self.currentTimer == nil) {
        [self createTimer];
        [operation start];
    } else {
        self.currentOpertation = operation;
    }
    
    return operation;
}

#pragma mark - Timer

- (void)createTimer {
    __weak typeof(self) weakSelf = self;
    NSTimer *timer = [NSTimer timerWithTimeInterval:self.delay repeats:NO block:^(NSTimer * _Nonnull timer) {
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.currentOpertation start];
        strongSelf.currentTimer = nil;
    }];
    
    self.currentTimer = timer;
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

@end
