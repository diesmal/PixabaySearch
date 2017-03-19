//
//  PBSSearchingPresenter.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSSearchingViewOutput.h"
#import "PBSSearchingInteractorOutput.h"

@protocol PBSSearchingViewInput;
@protocol PBSSearchingInteractorInput;
@protocol PBSSearchingRouterInput;

@interface PBSSearchingPresenter : NSObject <PBSSearchingViewOutput, PBSSearchingInteractorOutput>

@property (nonatomic, weak) id<PBSSearchingViewInput> view;
@property (nonatomic, strong) id<PBSSearchingInteractorInput> interactor;
@property (nonatomic, strong) id<PBSSearchingRouterInput> router;

@end
