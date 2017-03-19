//
//  PBSNetworkClient.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSNetworkingSharedTypes.h"

@protocol PBSCancelableOperation;

@protocol PBSNetworkClient <NSObject>

- (id<PBSCancelableOperation>)sendRequest:(NSURLRequest *)request
    completionBlock:(PBSNetworkClientCompletionBlock)block;

@end
