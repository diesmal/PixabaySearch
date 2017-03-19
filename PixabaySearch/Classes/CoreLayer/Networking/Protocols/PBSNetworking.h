//
//  PBSNetworking.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSNetworkingSharedTypes.h"

@protocol PBSNetworking <NSObject>

- (NSOperation *)addRequest:(NSURLRequest *)request completion:(PBSNetworkClientCompletionBlock)completionBlock;

- (NSOperation *)addRequest:(NSURLRequest *)request withSesion:(NSURLSession *)session completion:(PBSNetworkClientCompletionBlock)completionBlock;


@end
