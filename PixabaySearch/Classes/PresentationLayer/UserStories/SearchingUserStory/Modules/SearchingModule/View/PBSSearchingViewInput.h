//
//  PBSSearchingViewInput.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBSSearchingViewInput <NSObject>

- (NSString *)searchText;
- (void)update;
- (void)insertedItemsSince:(NSInteger)startIndex;

@end
