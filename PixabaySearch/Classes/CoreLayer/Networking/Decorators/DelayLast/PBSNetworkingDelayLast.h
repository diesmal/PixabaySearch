//
//  PBSNetworkingDelayLast.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSNetworking.h"
#import "PBSNetwrokingDecorator.h"

/**
 After adding a request, there is a delay.
 After the end of the delay, the last added query will be executed.
 */
@interface PBSNetworkingDelayLast : NSObject <PBSNetworking, PBSNetwrokingDecorator>

@property (nonatomic, assign) NSTimeInterval delay;

@end
