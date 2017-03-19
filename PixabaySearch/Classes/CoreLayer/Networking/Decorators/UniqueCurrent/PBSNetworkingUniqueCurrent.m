//
//  PBSNetworkingUniqueCurrent.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSNetworkingSharedTypes.h"

#import "PBSNetworkingUniqueCurrent.h"

@interface PBSNetworkingUniqueCurrent ()

@property (nonatomic, strong) id<PBSNetworking> superNetworking;
@property (nonatomic, weak) NSOperation *currentOpertation;

@end

@implementation PBSNetworkingUniqueCurrent

#pragma mark - Initialization

- (instancetype)initWithNetworking:(id<PBSNetworking>)networking {
    NSAssert(networking != nil, @"Networking should not be nil");
    if (self = [super init]) {
        self.superNetworking = networking;
    }
    return self;
}

#pragma mark - PBSNetworking

- (NSOperation *)addRequest:(NSURLRequest *)request completion:(PBSNetworkClientCompletionBlock)completionBlock {
    return [self addRequest:request withSesion:nil completion:completionBlock];
}

- (NSOperation *)addRequest:(NSURLRequest *)request withSesion:(NSURLSession *)session completion:(PBSNetworkClientCompletionBlock)completionBlock {
    if (self.currentOpertation) {
        return nil;
    }
    
    NSOperation *operation = [self.superNetworking addRequest:request withSesion:session completion:completionBlock];
    self.currentOpertation = operation;
    
    return operation;
}

@end
