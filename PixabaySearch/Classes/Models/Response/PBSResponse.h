//
//  PBSResponse.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessfulBlock)(id data);
typedef void (^FailedBlock)(NSError *error);

@interface PBSResponse : NSObject

@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSHTTPURLResponse *response;
@property (nonatomic, strong) id deserializedData;
@property (nonatomic, strong) id mappedData;

@property (nonatomic, copy) SuccessfulBlock successfulBlock;
@property (nonatomic, copy) FailedBlock failedBlock;

@end
