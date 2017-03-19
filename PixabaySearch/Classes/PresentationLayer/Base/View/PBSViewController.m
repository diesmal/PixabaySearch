//
//  PBSViewController.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSAssembly.h"
#import "PBSModuleOutputCommand.h"

#import "PBSViewController.h"

@interface PBSViewController ()

@end

@implementation PBSViewController

#pragma mark - Initialization

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self activateAssembly];
    }
    return self;
}

#pragma mark - Assembly

- (void)activateAssembly {
    NSString *currentClassName = NSStringFromClass([self class]);
    NSString *assemblyClassName = [currentClassName stringByReplacingOccurrencesOfString:@"ViewController"
                                                                              withString:@"ModuleAssembly"];
    Class assemblyClass = NSClassFromString(assemblyClassName);
    if (assemblyClass && [assemblyClass conformsToProtocol:@protocol(PBSAssembly)]) {
        [assemblyClass activateWithRoot: self];
    }
}

#pragma mark - Routing

- (void)openModuleUsingSegue:(NSString *)segueIdentifier andBlock:(PBSModuleOutputBlock) outputBlock {
    PBSModuleOutputCommand *command = [[PBSModuleOutputCommand alloc] initWithCommnad:outputBlock];
    [self performSegueWithIdentifier:segueIdentifier sender:command];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender && [sender isKindOfClass:[PBSModuleOutputCommand class]]) {
        PBSModuleOutputCommand *command = sender;
        id destinationViewController = segue.destinationViewController;
        [command executeWithInputModoule:destinationViewController];
    }
}

@end
