//
//  BlueSelectButton.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/5.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ImageButton : UIButton


@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *aTitleLabel;

-(void)setButtonLeftImage:(UIImage *)leftImage rightTitle:(NSString *)rightTitle target:(id)target action:(SEL)action;

@end
