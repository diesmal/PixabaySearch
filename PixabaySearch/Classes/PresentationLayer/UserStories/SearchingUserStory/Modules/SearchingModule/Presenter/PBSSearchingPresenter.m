//
//  PBSSearchingPresenter.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSSearchingViewInput.h"
#import "PBSSearchingRouterInput.h"
#import "PBSSearchingInteractorInput.h"

#import "PBSPixabayItems.h"
#import "PBSPixabayImageItem.h"

#import "PBSSearchingPresenter.h"

@interface PBSSearchingPresenter()
    
@property (nonatomic, strong) NSMutableArray<PBSPixabayImageItem *> *items;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, assign) NSUInteger totalItems;

@end

@implementation PBSSearchingPresenter

#pragma mark - PBSSearchingViewOutput

- (void)viewDidLoadTriggered {
    self.currentPage = 1;
    NSString *query = [self.view searchText];
    [self.interactor searchWithQuery:query page:self.currentPage];
}

- (NSInteger)itemsCount {
    return self.items.count;
}
- (NSString *)userNameAtIndex:(NSInteger)index {
    
    if (index == self.items.count - 1 && self.items.count < self.totalItems) {
        NSString *query = [self.view searchText];
        NSUInteger page = self.currentPage + 1;
        [self.interactor searchWithQuery:query page:page];
    }
    
    return self.items[index].userName;
}
- (NSString *)tagsAtIndex:(NSInteger)index {
    return self.items[index].tags;
}
- (NSURL *)imageURLAtIndex:(NSInteger)index {
    NSURL *url = [NSURL URLWithString:self.items[index].previewURL];
    return url;
}

- (void)searchTextDidChange:(NSString *)searchText {
    [self.interactor searchWithQuery:searchText page:1];
}

- (void)didSelectedItemAtIndex:(NSInteger)index {
    [self.router openDetailWithInfo:self.items[index]];
}

#pragma mark - PBSSearchingInteractorOutput

- (void)takeItems:(PBSPixabayItems *)pixabayItems forPage:(NSUInteger)page {
    self.currentPage = page;
    self.totalItems = [pixabayItems.totalItems unsignedIntegerValue];
    
    if (page == 1) {
        self.items = [pixabayItems.items mutableCopy];
        [self.view update];
    } else {
        NSUInteger prevCount = self.items.count;
        [self.items addObjectsFromArray:pixabayItems.items];
        [self.view insertedItemsSince:prevCount];
    }
}

- (void)takeError:(NSError *)error {
    [self.router showErrorWithTitle:@"Error" message:[error localizedDescription]];
}

@end
