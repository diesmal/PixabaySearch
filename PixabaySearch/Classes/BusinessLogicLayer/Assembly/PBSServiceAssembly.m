//
//  PBSServiceAssembly.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSPixabayServiceAssembly.h"
#import "PBSNetworkingImplementation.h"

#import "PBSServiceAssembly.h"

@implementation PBSServiceAssembly

+ (id<PBSNetworking>)commonNetworking {
    return [PBSNetworkingImplementation sharedNetworking];
}

+ (id<PBSPixabayService>)pixabayService {
    return [PBSPixabayServiceAssembly activateWithNetworking:[self commonNetworking]];
}

@end
