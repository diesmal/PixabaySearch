//
//  PBSDetailViewOutput.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBSDetailViewOutput <NSObject>

- (NSURL *)imageURL;
- (NSString *)userName;
- (NSString *)likesCount;
- (NSString *)favoritesCount;
- (NSString *)commentsCount;
- (NSString *)tagsCount;

@end
