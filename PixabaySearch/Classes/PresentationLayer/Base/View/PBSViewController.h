//
//  PBSViewController.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PBSModuleOutputBlock)(id moduleInput);

@interface PBSViewController : UIViewController

- (void)openModuleUsingSegue:(NSString *)segueIdentifier andBlock:(PBSModuleOutputBlock) outputBlock;

@end
