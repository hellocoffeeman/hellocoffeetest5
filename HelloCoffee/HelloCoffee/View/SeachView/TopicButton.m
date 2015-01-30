//
//  TopicButton.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/4.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "TopicButton.h"

@implementation TopicButton

-(void) setBarkColor:(UIColor *)backColor leftImage:(UIImage *)leftImage titleString:(NSString *)titleString describeString:(NSString *)describeString targrt:(id)target action:(SEL)action
{
    // 左图标
    UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    leftImageView.image = leftImage;
    [self addSubview:leftImageView];
    
    // 分组标题
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(((s_width-30)/2)-40, 10, 40, 20)];
    label.text = titleString;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.shadowColor = [UIColor colorWithWhite:0.1f alpha:0.25f]; // 阴影色彩和透明度
    label.shadowOffset = CGSizeMake(0.0f, 1.6f); // 阴影的倾斜角度
    label.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:18];
    [self addSubview:label];
    
    // 描述文段
    UILabel *describeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (s_width/2-30)/2-30, ((s_width-30)/2)-20, 30)];
    describeLabel.text = describeString;
    describeLabel.backgroundColor = [UIColor clearColor];
    describeLabel.textColor = [UIColor whiteColor];
    describeLabel.font = [UIFont systemFontOfSize:12.7];
    [self addSubview:describeLabel];
    
    // Action
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    self.backgroundColor = backColor;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 2.0;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/





@end
