//
//  photoCellCollectionViewCell.m
//  CollectionDemo
//
//  Created by SeaMoonTime on 24/03/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "smt_PhotoCell.h"

@interface smt_PhotoCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation smt_PhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self configureImageView];
    
}

- (void)configureImageView{
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 10;
}

- (void)setImageName:(NSString *)imageName{
    _imageName = [imageName copy];
    self.imageView.image = [UIImage imageNamed:imageName];
}

@end
