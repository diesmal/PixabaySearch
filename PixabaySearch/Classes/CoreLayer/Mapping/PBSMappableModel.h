//
//  PBSMappableModel.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBSMappableModel <NSObject>

/**
 Scheme for mapping

 @return mapping scheme like @{<targetKeyPath> : <sourceKeyPath>}
 */
+ (NSDictionary *)scheme;

@end
