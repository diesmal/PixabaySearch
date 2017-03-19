//
//  PBSJSONDeserialization.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSJSONDeserialization.h"

@implementation PBSJSONDeserialization

- (id)deserializeData:(NSData *)data error:(NSError **)error {
    id object = [NSJSONSerialization JSONObjectWithData: data options: 0 error: error];
    return object;
}

@end
