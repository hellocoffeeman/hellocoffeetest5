//
//  HeadCellView.h
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/30.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface HeadCellView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UILabel *centerLab;
@property (weak, nonatomic) IBOutlet UIImageView *rightImg;
@property (weak, nonatomic) IBOutlet UIImageView *lineBottom;

@end
