//
//  PBSSearchingInteractorOutput.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PBSPixabayItems;

@protocol PBSSearchingInteractorOutput <NSObject>

- (void)takeItems:(PBSPixabayItems *)pixabayItems forPage:(NSUInteger)page;
- (void)takeError:(NSError *)error;

@end
