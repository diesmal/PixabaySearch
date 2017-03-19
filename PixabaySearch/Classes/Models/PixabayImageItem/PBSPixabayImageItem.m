//
//  PBSPixabayImageItem.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSPixabayImageItem.h"

@implementation PBSPixabayImageItem

+ (NSDictionary *)scheme {
    return @{@"imageURL"    : @"webformatURL",
             @"previewURL"  : @"previewURL",
             @"userName"    : @"user",
             @"tags"        : @"tags",
             @"favorites"   : @"favorites",
             @"comments"    : @"comments",
             @"likes"       : @"likes"};
}

@end
