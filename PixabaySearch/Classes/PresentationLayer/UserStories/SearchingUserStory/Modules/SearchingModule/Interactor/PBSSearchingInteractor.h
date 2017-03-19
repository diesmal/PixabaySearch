//
//  PBSSearchingInteractor.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSSearchingInteractorInput.h"

@protocol PBSSearchingInteractorOutput;
@protocol PBSPixabayService;

@interface PBSSearchingInteractor : NSObject <PBSSearchingInteractorInput>

@property (nonatomic, weak) id<PBSSearchingInteractorOutput> output;
@property (nonatomic, strong) id<PBSPixabayService> pixabayService;

@end
