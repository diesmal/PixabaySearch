//
//  PBSMapper.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBSMappableModel;

@interface PBSMapper : NSObject

+ (id<PBSMappableModel>)mapData:(NSDictionary<NSString *, id> *)data toClass:(Class)targetClass;

+ (NSArray<id<PBSMappableModel>> *)mapArray:(NSArray<NSDictionary<NSString *, id> *> *)array
                           toArrayofClasses:(Class)targetClass;

@end
