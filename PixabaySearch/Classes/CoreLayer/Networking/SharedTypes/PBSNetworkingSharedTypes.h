//
//  PBSNetworkingSharedTypes.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PBSNetworkClientCompletionBlock)(NSData *data, NSHTTPURLResponse *response, NSError *error);
