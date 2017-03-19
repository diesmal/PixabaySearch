//
//  PBSPixabayServiceImplementation.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSNetworking.h"
#import "PBSPixabayRouter.h"
#import "PBSDeserialization.h"
#import "PBSMapper.h"
#import "PBSResponse.h"

#import "PBSPixabayItems.h"
#import "PBSPixabayImageItem.h"

#import "PBSPixabayServiceImplementation.h"

@interface PBSPixabayServiceImplementation ()

@property (nonatomic, strong) id<PBSNetworking> uniqueCurrentNetworking;
@property (nonatomic, strong) id<PBSNetworking> uniqueNewWithDelayNetworking;
@property (nonatomic, strong) id<PBSDeserialization> desserializator;

@end

@implementation PBSPixabayServiceImplementation

#pragma mark - Initialization

- (instancetype) initWithUniqueCurrentNetworking:(id<PBSNetworking>)uniqueCurrentNetworking
                 andUniqueNewWithDelayNetworking:(id<PBSNetworking>)uniqueNewWithDelayNetworking
                                 desserializator:(id<PBSDeserialization>)desserializator {
    
    if (self = [super init]) {
        self.uniqueCurrentNetworking = uniqueCurrentNetworking;
        self.uniqueNewWithDelayNetworking = uniqueNewWithDelayNetworking;
        self.desserializator  = desserializator;
    }
    
    return self;
}

#pragma mark - PBSPixabayService

- (void)searchWithQuery:(NSString *)query
                   page:(NSUInteger)page
             successful:(SuccessfulBlock)successful
                 failed:(FailedBlock)failed {
    
    NSURLRequest *request = [PBSPixabayRouter searchRequestWithQuery:query page:page];
    
    __weak typeof(self) weakSelf = self;
    PBSNetworkClientCompletionBlock requestCompletion = ^(NSData *data, NSHTTPURLResponse *response, NSError *error) {
        __strong typeof(self) strongSelf = weakSelf;
        
        if (error != nil) {
            [strongSelf executeFailed:failed error:error];
        } else {
            PBSResponse *pixabayResponse = [PBSResponse new];
            pixabayResponse.data = data;
            pixabayResponse.response = response;
            pixabayResponse.successfulBlock = successful;
            pixabayResponse.failedBlock = failed;
            
            [strongSelf processResponse:pixabayResponse];
        }
    };


    if (page > 1) {
        [self.uniqueCurrentNetworking addRequest:request completion:requestCompletion];
    } else {
        [self.uniqueNewWithDelayNetworking addRequest:request completion:requestCompletion];
    }
 
}

#pragma mark - Helpers 

- (void)executeSuccessful:(SuccessfulBlock)successful data:(id)data {
    if (successful) {
        dispatch_async(dispatch_get_main_queue(), ^{
            successful(data);
        });
    }
}

- (void)executeFailed:(FailedBlock)failed error:(NSError *)error {
    if (failed) {
        dispatch_async(dispatch_get_main_queue(), ^{
            failed(error);
        });
    }
}

#pragma mark - Response processing

- (void)processResponse:(PBSResponse *)response {
    
    NSError *error = [self desserializeResponse:response];
    if (error) {
        [self executeFailed:response.failedBlock error:error];
    }
    error = [self mapResponse:response];
    if (error) {
        [self executeFailed:response.failedBlock error:error];
    } else {
        [self executeSuccessful:response.successfulBlock data:response.mappedData];
    }
}

- (NSError *)desserializeResponse:(PBSResponse *)response {
    NSError *error = nil;
    response.deserializedData = [self.desserializator deserializeData:response.data
                                                                error:&error];
    return error;
}

- (NSError *)mapResponse:(PBSResponse *)response {
    NSError *error = nil;
    
    if ([response.deserializedData isKindOfClass:[NSDictionary class]]) {
        PBSPixabayItems *items = [PBSMapper mapData:response.deserializedData toClass:[PBSPixabayItems class]];
        NSArray *hits = response.deserializedData[@"hits"];
        items.items = [PBSMapper mapArray:hits toArrayofClasses:[PBSPixabayImageItem class]];
        
        response.mappedData = items;
    }

    return error;
}

@end
