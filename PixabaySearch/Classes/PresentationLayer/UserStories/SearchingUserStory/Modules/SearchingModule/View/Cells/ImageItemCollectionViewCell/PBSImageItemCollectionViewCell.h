//
//  PBSImageItemCollectionViewCell.h
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBSImageItemCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *tags;

@property (strong, nonatomic) NSURL *imageURL;

@end
