//
//  PBSDetailViewController.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSViewController.h"

#import "PBSDetailViewInput.h"

@protocol PBSDetailViewOutput;

@interface PBSDetailViewController : PBSViewController <PBSDetailViewInput>

@property (nonatomic, strong) id<PBSDetailViewOutput> output;

@end
