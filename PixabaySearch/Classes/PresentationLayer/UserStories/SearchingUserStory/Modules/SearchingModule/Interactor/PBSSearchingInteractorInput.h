//
//  PBSSearchingInteractorInput.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBSSearchingInteractorInput <NSObject>

- (void)searchWithQuery:(NSString *)query page:(NSUInteger)page;

@end
