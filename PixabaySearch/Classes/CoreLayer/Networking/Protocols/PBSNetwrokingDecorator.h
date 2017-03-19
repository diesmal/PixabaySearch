//
//  PBSNetwrokingDecorator.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBSNetworking;

@protocol PBSNetwrokingDecorator <NSObject>

- (instancetype)initWithNetworking:(id<PBSNetworking>)networking;

@end
