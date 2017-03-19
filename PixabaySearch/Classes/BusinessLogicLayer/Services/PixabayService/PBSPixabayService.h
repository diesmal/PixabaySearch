//
//  PBSPixabayService.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessfulBlock)(id data);
typedef void (^FailedBlock)(NSError *error);

@protocol PBSPixabayService <NSObject>

- (void)searchWithQuery:(NSString *)query
                   page:(NSUInteger)page
             successful:(SuccessfulBlock)successful
                 failed:(FailedBlock)failed;

@end
