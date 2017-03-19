//
//  PBSTestModel.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PBSMappableModel.h"

@interface PBSTestModel : NSObject <PBSMappableModel>

@property (nonatomic, strong) NSString *valueString;
@property (nonatomic, strong) NSNumber *valueNumber;

@end
