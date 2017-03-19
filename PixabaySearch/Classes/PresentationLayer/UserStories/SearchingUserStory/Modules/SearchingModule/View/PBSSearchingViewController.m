//
//  PBSSearchingViewController.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSSearchingViewOutput.h"

#import "PBSImageItemCollectionViewCell.h"

#import "PBSSearchingViewController.h"

@interface PBSSearchingViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIView *noResultsView;

@end

@implementation PBSSearchingViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output viewDidLoadTriggered];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - PBSSearchingViewInput

- (void)update {
    [self.collectionView reloadData];
}

- (NSString *)searchText {
    return self.searchBar.text;
}

- (void)insertedItemsSince:(NSInteger)startIndex {
    
    [self.collectionView performBatchUpdates:^{
        
        NSUInteger endIndex = [self.output itemsCount];
        NSMutableArray *insertingIndexPaths = [NSMutableArray arrayWithCapacity: (endIndex - startIndex)];
        
        for (NSUInteger i = startIndex; i < endIndex; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [insertingIndexPaths addObject:indexPath];
        }
        [self.collectionView insertItemsAtIndexPaths:insertingIndexPaths];
        
    } completion:nil];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSUInteger itemsCount = self.output.itemsCount;
    self.noResultsView.hidden = (itemsCount != 0);
    return itemsCount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PBSImageItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PBSImageItemCollectionViewCell" forIndexPath:indexPath];
    
    cell.userName.text = [self.output userNameAtIndex:indexPath.row];
    cell.tags.text = [self.output tagsAtIndex:indexPath.row];
    cell.imageURL = [self.output imageURLAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.output didSelectedItemAtIndex:indexPath.row];
}

#pragma mark - UISearchBarDelegate 

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.output searchTextDidChange:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

@end
