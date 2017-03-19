//
//  PBSDetailModuleAssembly.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSDetailViewController.h"
#import "PBSDetailPresenter.h"

#import "PBSDetailModuleAssembly.h"

@implementation PBSDetailModuleAssembly

+ (void)activateWithRoot:(id)root {
    
    if ([root isKindOfClass:[PBSDetailViewController class]]) {
        PBSDetailViewController *view = root;
        PBSDetailPresenter *presenter = [PBSDetailPresenter new];
   
        presenter.view = view;
        view.output = presenter;
    }
}

@end
