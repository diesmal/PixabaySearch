//
//  PBSPixabayServiceAssembly.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSPixabayServiceImplementation.h"

#import "PBSNetworkingDelayLast.h"
#import "PBSNetworkingUniqueCurrent.h"
#import "PBSNetworkingUniqueNew.h"

#import "PBSJSONDeserialization.h"

#import "PBSPixabayServiceAssembly.h"

@implementation PBSPixabayServiceAssembly

+ (id<PBSPixabayService>)activateWithNetworking:(id<PBSNetworking>)networking {
    
    id<PBSNetworking> uniqueCurrentNetworking = [[PBSNetworkingUniqueCurrent alloc] initWithNetworking:networking];
    id<PBSNetworking> uniqueNewNetworking = [[PBSNetworkingUniqueNew alloc] initWithNetworking:networking];
    id<PBSNetworking> uniqueNewWithDelayNetworking = [[PBSNetworkingDelayLast alloc] initWithNetworking:uniqueNewNetworking];
    
    id<PBSDeserialization> desserializator = [PBSJSONDeserialization new];
    
    return [[PBSPixabayServiceImplementation alloc] initWithUniqueCurrentNetworking: uniqueCurrentNetworking
                                                    andUniqueNewWithDelayNetworking: uniqueNewWithDelayNetworking
                                                                    desserializator: desserializator];
}

@end
