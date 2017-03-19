//
//  PBSSearchingModuleAssembly.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSSearchingViewController.h"
#import "PBSSearchingPresenter.h"
#import "PBSSearchingInteractor.h"
#import "PBSSearchingViewController+Router.h"

#import "PBSServiceAssembly.h"

#import "PBSSearchingModuleAssembly.h"

@implementation PBSSearchingModuleAssembly

+ (void)activateWithRoot:(id)root {
    
    if ([root isKindOfClass:[PBSSearchingViewController class]]) {
        PBSSearchingViewController *view = root;
        PBSSearchingPresenter *presenter = [PBSSearchingPresenter new];
        PBSSearchingInteractor *interactor =[PBSSearchingModuleAssembly interactor];
        PBSSearchingViewController *router = root;
        
        presenter.view = view;
        presenter.interactor = interactor;
        presenter.router = router;
        view.output = presenter;
        interactor.output = presenter;
    }
}


+ (PBSSearchingInteractor *)interactor {
    PBSSearchingInteractor *interactor = [PBSSearchingInteractor new];
    id<PBSPixabayService> pixabayService = [PBSServiceAssembly pixabayService];
    
    interactor.pixabayService = pixabayService;
    
    return interactor;
}

@end
