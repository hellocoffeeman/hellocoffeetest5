//
//  SegmentButtonView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/21.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "SegmentButtonView.h"

@implementation SegmentButtonView

// 根据 View 的 Frame、传入的参数 初始化
-(void)setButtonsWithCount:(int)count buttonTitles:(NSArray *)titlesArray target:(id)target buttonAction:(SEL)buttonAction
{
    if (self.buttonArray.count != 7) {
        [self addButtonInButtonArray];
    }
    
    float width = self.frame.size.width/count; // Button的width
    float height = self.frame.size.height;
    
    // 遍历 7个Button
    for (int i = 0; i < 7; i++) {
        
        UIButton *button = (UIButton *)self.buttonArray[i];
        button.frame = CGRectMake(width*i, 0, width, height);
        
        if (i < count) {
            // 设置
            button.tag = 2000+i;
            [button setTitle:titlesArray[i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize: 25.0];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [button addTarget:target action:buttonAction forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            
            NSLog(@"Button [ Title:%@ ; Frame:%@ ;  ]",titlesArray[i],NSStringFromCGRect(button.frame));

        }
    }
}

-(void) addButtonInButtonArray
{
    self.selectBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn7 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.buttonArray = [NSArray arrayWithObjects:self.selectBtn1,self.selectBtn2,self.selectBtn3,self.selectBtn4,self.selectBtn5,self.selectBtn6,self.selectBtn7, nil];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
