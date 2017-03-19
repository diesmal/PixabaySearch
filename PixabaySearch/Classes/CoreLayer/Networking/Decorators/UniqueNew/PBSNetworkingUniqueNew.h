//
//  PBSNetworkingUniqueNew.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSNetworking.h"
#import "PBSNetwrokingDecorator.h"

/**
 When add a new query, the current one is canceled.
 */
@interface PBSNetworkingUniqueNew : NSObject <PBSNetworking, PBSNetwrokingDecorator>

@end
