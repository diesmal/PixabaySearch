//
//  PBSSearchingViewController+Router.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSDetailModuleInput.h"

#import "PBSSearchingViewController+Router.h"

static NSString *const kSearchingModuleToDetailModuleSegue = @"SearchingToDetailSegue";

@implementation PBSSearchingViewController (Router)

- (void)openDetailWithInfo:(id)info {
    
    [self openModuleUsingSegue:kSearchingModuleToDetailModuleSegue andBlock:^(id moduleInput) {
        if ([moduleInput conformsToProtocol:@protocol(PBSDetailModuleInput)]) {
            id<PBSDetailModuleInput> detailModuleInput = moduleInput;
            [detailModuleInput configureModuleWithObject:info];
        }
    }];
}

- (void)showNetworkActivity {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)hideNetworkActivity {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)showErrorWithTitle:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"Ok"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
   
    [alert addAction:closeAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
