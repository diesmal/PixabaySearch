//
//  PBSDetailPresenter.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSDetailViewOutput.h"
#import "PBSDetailModuleInput.h"

@protocol PBSDetailViewInput;

@interface PBSDetailPresenter : NSObject <PBSDetailViewOutput, PBSDetailModuleInput>

@property (nonatomic, weak) id<PBSDetailViewInput> view;

@end
