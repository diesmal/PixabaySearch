//
//  PBSDetailPresenter.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSDetailPresenter.h"

#import "PBSPixabayImageItem.h"

@interface PBSDetailPresenter()

@property (nonatomic, strong) PBSPixabayImageItem *item;

@end

@implementation PBSDetailPresenter

- (void)configureModuleWithObject:(id)item {
    self.item = item;
}

- (NSURL *)imageURL {
    return [NSURL URLWithString:self.item.imageURL];
}

- (NSString *)userName {
    return self.item.userName;
}

- (NSString *)likesCount {
    return [self.item.likes stringValue];
}

- (NSString *)favoritesCount {
    return [self.item.favorites stringValue];
}

- (NSString *)commentsCount {
    return [self.item.comments stringValue];
}

- (NSString *)tagsCount {
    return self.item.tags;
}

@end
