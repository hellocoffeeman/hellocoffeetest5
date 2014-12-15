//
//  ReserveButtonView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/20.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ReserveButtonView.h"

@implementation ReserveButtonView

// 重写初始化方法
-(instancetype)initWithFrame:(CGRect)frame buttonTarget:(id)target buttonAction:(SEL)action
{
    // Size : 320 * 49
    
    if(self = [super init]) {
        
        self.frame = frame;
        self.alpha = 1.0;
        self.backgroundColor = kBlueColor; // 背景色
        
        UIButton *reserveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        reserveBtn.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [reserveBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [reserveBtn setBackgroundImage:[UIImage imageNamed:@"woxianglaizuozuo-zi"] forState:UIControlStateNormal];
        [self addSubview:reserveBtn];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
