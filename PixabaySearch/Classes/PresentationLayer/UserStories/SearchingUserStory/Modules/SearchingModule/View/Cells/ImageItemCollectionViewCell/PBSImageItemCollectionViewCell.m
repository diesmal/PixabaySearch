//
//  PBSImageItemCollectionViewCell.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <SDWebImage/SDWebImage.h>

#import "PBSImageItemCollectionViewCell.h"

@interface PBSImageItemCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PBSImageItemCollectionViewCell

- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;
    UIImage *placeholder = [UIImage imageNamed:@"preview-placeholder"];
    [self.imageView sd_setImageWithURL:imageURL placeholderImage:placeholder];
}

@end
