//
//  PBSPixabayRouter.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSSettings.h"

#import "PBSPixabayRouter.h"

//baseAPIAddress, apiKey, searchQuery, page
static NSString *const kSearchingPathMask = @"%@/?key=%@&q=%@&page=%lud";

@implementation PBSPixabayRouter

+ (NSString *)baseAPIAddress {
    static NSString *_baseAPIAddress = nil;
    if (_baseAPIAddress == nil) {
        _baseAPIAddress = [PBSSettings pixabayAPIServer];
    }
    return _baseAPIAddress;
}

+ (NSString *)apiKey {
    static NSString *_apiKey = nil;
    if (_apiKey == nil) {
        _apiKey = [PBSSettings pixabayAPIKey];
    }
    return _apiKey;
}

+ (NSURLRequest *)urlRequestForPath:(NSString *)path {
    
    NSCharacterSet *urlAllowedSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *urlPath = [path stringByAddingPercentEncodingWithAllowedCharacters: urlAllowedSet];
    NSURL *url = [NSURL URLWithString:urlPath];
    if (url) {
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url
                                                 cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                             timeoutInterval:60];
        return request;
    }
    return nil;
}

+ (NSURLRequest *)searchRequestWithQuery:(NSString *)query page:(NSUInteger)page {
    
    NSString *apiAddr = [PBSPixabayRouter baseAPIAddress];
    NSString *apiKey = [PBSPixabayRouter apiKey];
    
    NSString *urlPath = [NSString stringWithFormat:kSearchingPathMask, apiAddr, apiKey, query, (unsigned long)page];
    
    return [PBSPixabayRouter urlRequestForPath: urlPath];
}

@end
