//
//  PBSSearchingViewOutput.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBSSearchingViewOutput <NSObject>

- (NSInteger)itemsCount;
- (NSString *)userNameAtIndex:(NSInteger)index;
- (NSString *)tagsAtIndex:(NSInteger)index;
- (NSURL *)imageURLAtIndex:(NSInteger)index;

- (void)viewDidLoadTriggered;
- (void)searchTextDidChange:(NSString *)searchText;
- (void)didSelectedItemAtIndex:(NSInteger)index;

@end
