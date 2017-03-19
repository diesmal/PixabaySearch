//
//  PBSSearchingViewController.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSViewController.h"

#import "PBSSearchingViewInput.h"

@protocol PBSSearchingViewOutput;

@interface PBSSearchingViewController : PBSViewController <PBSSearchingViewInput>

@property (nonatomic, strong) id<PBSSearchingViewOutput> output;

@end
