//
//  PBSDetailViewController+ModuleInput.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSDetailViewOutput.h"

#import "PBSDetailViewController+ModuleInput.h"

@class PBSPixabayImageItem;

@implementation PBSDetailViewController (ModuleInput)

- (void)configureModuleWithObject:(PBSPixabayImageItem *)item {
    if ([self.output conformsToProtocol:@protocol(PBSDetailModuleInput)]) {
        id<PBSDetailModuleInput> moduleInput = (id<PBSDetailModuleInput>)self.output;
        [moduleInput configureModuleWithObject:item];
    }
}

@end
