//
//  PBSSettings.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 19/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import "PBSSettings.h"

@implementation PBSSettings

+ (NSString *)pixabayAPIServer {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Pixabay"][@"APIServer"];
}

+ (NSString *)pixabayAPIKey {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Pixabay"][@"APIKey"];
}

@end
