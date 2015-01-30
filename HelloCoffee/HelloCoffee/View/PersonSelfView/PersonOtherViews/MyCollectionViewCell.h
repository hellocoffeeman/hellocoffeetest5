//
//  MyCollectionViewCell.h
//  shiPei
//
//  Created by HelloCoffee on 14/12/31.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *headImg;
@property (weak, nonatomic) IBOutlet UILabel *dainzan;
@property (weak, nonatomic) IBOutlet UILabel *shijian;
@property (weak, nonatomic) IBOutlet UIImageView *ciImg;
@property (weak, nonatomic) IBOutlet UILabel *fuTouLab;
@property (weak, nonatomic) IBOutlet UILabel *fuDteail;
- (IBAction)btndown:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *huanLab;

@end
