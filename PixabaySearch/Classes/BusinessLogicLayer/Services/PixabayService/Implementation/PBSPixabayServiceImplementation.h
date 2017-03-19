//
//  PBSPixabayServiceImplementation.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSPixabayService.h"

@protocol PBSNetworking;
@protocol PBSDeserialization;

@interface PBSPixabayServiceImplementation : NSObject <PBSPixabayService>

- (instancetype) initWithUniqueCurrentNetworking:(id<PBSNetworking>)uniqueCurrentNetworking
                 andUniqueNewWithDelayNetworking:(id<PBSNetworking>)uniqueNewWithDelayNetworking
                                 desserializator:(id<PBSDeserialization>)desserializator;

@end
