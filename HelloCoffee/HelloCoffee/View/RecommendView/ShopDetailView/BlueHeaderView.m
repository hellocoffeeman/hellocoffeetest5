//
//  BlueHeaderView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/17.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "BlueHeaderView.h"

@implementation BlueHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title showCommentCountButton:(BOOL)showCommentCountButton target:(id)target commentCountButtonAction:(SEL)commentCountButtonAction
{
    self = [super initWithFrame:frame];
    
    if (self) {
       // 竖 蓝View
        UIView *verticalView = [[UIView alloc] initWithFrame:CGRectMake(5, 3, 7, 31)];
        verticalView.backgroundColor = kBlueColor;
        [self addSubview:verticalView];
        
       // 横 蓝View
        UIView *horizontalView = [[UIView alloc] initWithFrame:CGRectMake(15, 34, s_width-10, 1)];
        horizontalView.backgroundColor = kBlueColor;
        [self addSubview:horizontalView];
        
       // “ 来自 ” Label
        UILabel *label_1 = [[UILabel alloc] initWithFrame:CGRectMake(17, 14, 28, 15)];
        label_1.text = @"来自";
        label_1.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:label_1];
        
       // 标题 Label
        UILabel *label_2 = [[UILabel alloc] initWithFrame:CGRectMake(45, 9, s_width-80, 20)];
        label_2.text = title;
        label_2.font = [UIFont systemFontOfSize:22.0];
        [self addSubview:label_2];
        
       // 是否 显示评论数 Button + Label
        if (showCommentCountButton == YES) {
            
            
            
            
        }
        
    }
    
    return self;
}


@end
