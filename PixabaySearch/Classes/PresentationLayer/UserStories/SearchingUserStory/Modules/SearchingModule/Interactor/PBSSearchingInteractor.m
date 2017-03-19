//
//  PBSSearchingInteractor.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSPixabayService.h"
#import "PBSSearchingInteractorOutput.h"

#import "PBSSearchingInteractor.h"

@implementation PBSSearchingInteractor

- (void)searchWithQuery:(NSString *)query page:(NSUInteger)page {
    
    __weak typeof(self) weakSelf = self;
    
    [self.pixabayService searchWithQuery:query page:page successful:^(id data) {
        __strong typeof(self) strongSelf = weakSelf;
        
        [strongSelf.output takeItems:data forPage:page];
        
    } failed:^(NSError *error) {
        __strong typeof(self) strongSelf = weakSelf;
        
        [strongSelf.output takeError:error];
        
    }];
}

@end
