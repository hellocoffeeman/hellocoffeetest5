//
//  BlueSelectButton.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/5.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "ImageButton.h"



@implementation ImageButton

-(void)setButtonLeftImage:(UIImage *)leftImage rightTitle:(NSString *)rightTitle target:(id)target action:(SEL)action
{
//    self.backgroundColor = kBackColor;
    self.backgroundColor = [UIColor clearColor];
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    
    // 图标 16 * 16
    self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 2.5, 15, 15)];
    self.leftImageView.image = leftImage;
    
    // 标题 50 * 16
    self.aTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, self.bounds.size.width-25, 20)];
    self.aTitleLabel.textAlignment = NSTextAlignmentRight;
    self.aTitleLabel.font = [UIFont systemFontOfSize:13];
    self.aTitleLabel.textColor = RGB(102, 102, 102);
//    self.aTitleLabel.backgroundColor = kBlueColor;
    self.aTitleLabel.text = rightTitle;

    [self addSubview:self.leftImageView];
    [self addSubview:self.aTitleLabel];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
