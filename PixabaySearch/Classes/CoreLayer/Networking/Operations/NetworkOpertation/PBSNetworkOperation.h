//
//  PBSNetworkOperation.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSAsynchronousOperation.h"
#import "PBSNetworkingSharedTypes.h"

@protocol PBSNetworkClient;
@protocol PBSResponseCache;

@interface PBSNetworkOperation : PBSAsynchronousOperation

@property (nonatomic, strong) NSURLRequest *request;
@property (nonatomic, copy) PBSNetworkClientCompletionBlock completion;
@property (nonatomic, weak) id<PBSResponseCache> cache;

+ (instancetype)operationWithNetworkClient:(id<PBSNetworkClient>)networkClient;

@end
