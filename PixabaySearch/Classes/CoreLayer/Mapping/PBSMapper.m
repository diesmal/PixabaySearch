//
//  PBSMapper.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSMappableModel.h"

#import "PBSMapper.h"

@implementation PBSMapper

+ (id<PBSMappableModel>)mapData:(NSDictionary<NSString *, id> *)data toClass:(Class)targetClass {
    if ([targetClass conformsToProtocol:@protocol(PBSMappableModel)]) {
        NSObject<PBSMappableModel> *model = [targetClass new];
        NSDictionary *scheme = [targetClass scheme];
        
        for (NSString *key in [scheme allKeys]) {
            id valueKey = scheme[key];
            id value = [data valueForKeyPath:valueKey];
            
            if (value) {
                [model setValue:value forKeyPath:key];
            }
        }
        return model;
    }
    return nil;
}

+ (NSArray<id<PBSMappableModel>> *)mapArray:(NSArray<NSDictionary<NSString *, id> *> *)array
                           toArrayofClasses:(Class)targetClass {
    
    NSMutableArray *models = [NSMutableArray arrayWithCapacity:[array count]];
    
    for (NSDictionary<NSString *, id> *modelData in array) {
        id model = [PBSMapper mapData:modelData toClass:targetClass];
        if (model) {
            [models addObject: model];
        }
    }
    if ([models count] > 0 || [array count] == 0) {
       return models;
    }
    return nil;
}

@end
