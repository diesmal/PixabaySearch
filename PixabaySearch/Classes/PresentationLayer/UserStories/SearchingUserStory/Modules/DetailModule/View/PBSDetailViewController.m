//
//  PBSDetailViewController.m
//  PixabaySearch
//
//  Created by Ilya Nikolaenko on 18/03/2017.
//  Copyright © 2017 Ilya Nikolaenko. All rights reserved.
//

#import <SDWebImage/SDWebImage.h>

#import "PBSDetailViewOutput.h"

#import "PBSDetailViewController.h"

@interface PBSDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoritesLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
@property (weak, nonatomic) IBOutlet UITextField *tagsLabel;


@end

@implementation PBSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}

- (void)setup {
    self.userLabel.text = [self.output userName];
    self.likesLabel.text = [self.output likesCount];
    self.favoritesLabel.text = [self.output favoritesCount];
    self.commentsLabel.text = [self.output commentsCount];
    self.tagsLabel.text = [self.output tagsCount];
    
    UIImage *placeholder = [UIImage imageNamed:@"default-placeholder"];
    [self.imageView sd_setImageWithURL:[self.output imageURL]
                      placeholderImage:placeholder];
}

@end
