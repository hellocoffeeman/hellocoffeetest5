//
//  BlueHeaderView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/17.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "BlueHeaderView.h"

@implementation BlueHeaderView

#pragma maek - Header View -
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title leftImage:(UIImage *)leftImage
{
    self = [super initWithFrame:frame];
    if (self) {
        // 背景图
        UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, s_width-10, self.bounds.size.height-10)];
        backImageView.image = [UIImage imageNamed:@"wenzhangkapian1"];
        [self addSubview:backImageView];
        
        // 左图标 16 * 16
        UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 17, 20, 20)];
        leftImageView.image = leftImage;
        [backImageView addSubview:leftImageView];
        leftImageView.center = CGPointMake(leftImageView.center.x, self.center.y);
        
        // 标题 Label
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(35, 17, s_width-80, 20)];
        label.text = title;
        label.textColor = kBlueColor;
        label.font = [UIFont systemFontOfSize:18.5];
        [backImageView addSubview:label];
        label.center = CGPointMake(label.center.x, self.center.y);

    }
//    self.backgroundColor = [UIColor orangeColor];
    return self;
}

#pragma mark - CommentButton -
-(void)setCommentButtonWithTarget:(id)target commentAction:(SEL)commentAction currentCount:(int)currentCount
{
//    // CommentButton 40*30
//    UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    commentButton.frame = CGRectMake(s_width-40, 13, 35, 20);
//    [commentButton addTarget:target action:commentAction forControlEvents:UIControlEventTouchDown];
//    [self addSubview:commentButton];
//    
//    // ImageView
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 12, 11)];
//    imageView.image = [UIImage imageNamed:@"pingluntubiao.png"]; // Image : 12*11
//    [commentButton addSubview:imageView];
//    
//    // Count Label
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 20, 20)];
//    label.text = [NSString stringWithFormat:@"%d",currentCount];
//    label.font = [UIFont systemFontOfSize:14.0];
//    [commentButton addSubview:label];

}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
@end
