//
//  PBSPixabayItems.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSMappableModel.h"

@class PBSPixabayImageItem;

@interface PBSPixabayItems : NSObject <PBSMappableModel>

@property (nonatomic, strong) NSArray<PBSPixabayImageItem *> *items;
@property (nonatomic, strong) NSNumber *totalItems;

@end
