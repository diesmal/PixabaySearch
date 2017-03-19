//
//  PBSPixabayImageItem.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSMappableModel.h"

@interface PBSPixabayImageItem : NSObject <PBSMappableModel>

@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *previewURL;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSNumber *favorites;
@property (nonatomic, strong) NSNumber *comments;
@property (nonatomic, strong) NSNumber *likes;

@end
