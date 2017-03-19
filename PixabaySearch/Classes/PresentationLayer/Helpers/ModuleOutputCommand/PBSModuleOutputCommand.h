//
//  PBSModuleOutputCommand.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PBSModuleOutputBlock)(id moduleInput);

@interface PBSModuleOutputCommand : NSObject

- (instancetype)initWithCommnad:(PBSModuleOutputBlock)command;
- (void)executeWithInputModoule:(id)inputModule;

@end
