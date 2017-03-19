//
//  PBSPixabayRouter.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBSPixabayRouter : NSObject

+ (NSURLRequest *)searchRequestWithQuery:(NSString *)query page:(NSUInteger)page;

@end
