//
//  PBSPixabayServiceAssembly.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBSPixabayService;
@protocol PBSNetworking;

@interface PBSPixabayServiceAssembly : NSObject

+ (id<PBSPixabayService>)activateWithNetworking:(id<PBSNetworking>)networking;

@end
