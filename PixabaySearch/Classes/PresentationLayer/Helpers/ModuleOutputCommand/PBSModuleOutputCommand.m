//
//  PBSModuleOutputCommand.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSModuleOutputCommand.h"

@interface PBSModuleOutputCommand ()

@property (nonatomic, copy) PBSModuleOutputBlock command;

@end

@implementation PBSModuleOutputCommand

- (instancetype)initWithCommnad:(PBSModuleOutputBlock)command {
    self = [super init];
    if (self) {
        self.command = command;
    }
    return self;
}

- (void)executeWithInputModoule:(id)inputModule {
    if (self.command) {
        self.command(inputModule);
    }
}

@end
