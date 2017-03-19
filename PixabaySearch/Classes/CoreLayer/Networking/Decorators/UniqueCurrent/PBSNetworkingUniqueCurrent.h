//
//  PBSNetworkingUniqueCurrent.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSNetworking.h"
#import "PBSNetwrokingDecorator.h"

/**
 A new query is not added if there is a current one.
 */
@interface PBSNetworkingUniqueCurrent : NSObject <PBSNetworking, PBSNetwrokingDecorator>

@end
