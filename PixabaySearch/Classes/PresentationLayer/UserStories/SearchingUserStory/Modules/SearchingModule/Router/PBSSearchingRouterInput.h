//
//  PBSSearchingRouterInput.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PBSSearchingRouterInput <NSObject>

- (void)openDetailWithInfo:(id)info;
- (void)showErrorWithTitle:(NSString *)title message:(NSString *)message;

@end
