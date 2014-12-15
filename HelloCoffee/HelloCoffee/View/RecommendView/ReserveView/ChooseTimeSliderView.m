//
//  ChooseTimeSliderView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/25.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ChooseTimeSliderView.h"


@implementation ChooseTimeSliderView
{
    float _x; // 记录 滑动点 x
    float _y; // 记录 滑动点 y
    float _totalLength;
    float _currentLength;
}
-(void)setNowDateString:(NSString *)dateString timeString:(NSString *)timeString
{
    self.sliderButton.center = CGPointMake(0, self.frame.size.height - 30);
    
    // 设置当前时间
    self.timeLabel.text = timeString;
    [self nowTimePosizition:self.timeLabel];

    
    // _totalLength 赋值
    _totalLength=self.bounds.size.width;
    _currentLength=self.sliderButton.center.x;
    
    // _x 、 _y 赋值
    _x = self.sliderButton.center.x;
    _y = self.sliderButton.center.y;
    
    // 设置当前时间、日期
//    [self dateString:self.dateLabel];

    [self changeOpenState];
    
    // 坐标
    self.sliderLineIV.frame = CGRectMake(0, _y - 1.5, _totalLength, 3);
    self.borderImageView.frame = CGRectMake(_x , _y - 5 , 0, 0);
    [self insertSubview:self.borderImageView atIndex:0];
    self.timeLabel.center=CGPointMake(_x, _y - 18);
    self.dateLabel.center=CGPointMake(_x, _y + 18);
    
    
    // 为 SliderButton 添加方法 [ TouchDown、TouchUp、PanGesture ]
    [self.sliderButton addTarget:self action:@selector(sliderButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.sliderButton addTarget:self action:@selector(sliderButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [self.sliderButton addGestureRecognizer:pan]; // Button上 添加平移手势
    
    
    // 隐藏 dateLabel
    self.dateLabel.hidden = YES;
    
}


#pragma mark - Animation -

-(void)borderImageViewAnimationWithBOOL:(BOOL)aBOOL{

    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    
    if (aBOOL) {
        self.borderImageView.frame = CGRectMake(self.borderImageView.center.x , _y - 5, 0, 0);
    }else{
        self.borderImageView.frame = CGRectMake(self.borderImageView.center.x - 37.5, _y - 70, 75, 65);
    }
    
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}
-(void)dateLabelCoordAnimationWithY1:(float)Y1 Y2:(float)Y2{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    self.dateLabel.center = CGPointMake(self.dateLabel.center.x, Y1);
    self.timeLabel.center = CGPointMake(self.timeLabel.center.x, Y2);
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
}

#pragma mark - Slider Button Action -
// TouchUp
-(void)sliderButtonTouchUp:(UIButton *)button{
    
    [self borderImageViewAnimationWithBOOL:YES];
    // timeLabel、datelabel 回原位
    [self dateLabelCoordAnimationWithY1:_y + 18 Y2:_y - 18];

}
// TouchDown
-(void)sliderButtonTouchDown:(UIButton *)button{
    
    [self borderImageViewAnimationWithBOOL:NO];

    // timeLabel、datelabel 动画到Line上
    [self dateLabelCoordAnimationWithY1:_y - 33 Y2:_y - 40];

}
// PanGesture
-(void)panAction:(UIPanGestureRecognizer *)pan{
    
    CGPoint point = [pan translationInView:self];
    
    if ([(UIPanGestureRecognizer *)pan state]==UIGestureRecognizerStateBegan) {
        self.sliderButton.center=CGPointMake(_x+point.x, _y);
    }
    if ([(UIPanGestureRecognizer *)pan state]==UIGestureRecognizerStateChanged) {
        self.sliderButton.center=CGPointMake(_x+point.x, _y);
    }
    if ([(UIPanGestureRecognizer *)pan state]==UIGestureRecognizerStateEnded || [(UIPanGestureRecognizer *)pan state]==UIGestureRecognizerStateCancelled) {
        
        self.sliderButton.center=CGPointMake(_x+point.x, _y);
        _x=_x+point.x;
        [self borderImageViewAnimationWithBOOL:YES];
        // timeLabel、datelabel 回原位
        [self dateLabelCoordAnimationWithY1:_y + 18 Y2:_y - 18];
     }
    
    if (self.sliderButton.center.x<=0) {
        self.sliderButton.center=CGPointMake(0, self.sliderButton.center.y);
    }else if(self.sliderButton.center.x>=self.bounds.size.width-0){
        self.sliderButton.center=CGPointMake(self.bounds.size.width-0, self.sliderButton.center.y);
    }
    
    [self changeOpenState];
    [self timeString:self.timeLabel];
//    [self dateString:self.dateLabel];
    
    self.borderImageView.center=CGPointMake(self.sliderButton.center.x, self.borderImageView.center.y);
    self.timeLabel.center=CGPointMake(self.sliderButton.center.x, self.timeLabel.center.y);
    self.dateLabel.center=CGPointMake(self.sliderButton.center.x, self.dateLabel.center.y);
 
}

// 判断更改营业状态
-(void)changeOpenState{
    
    float num=(_currentLength/_totalLength)*24.0;
    NSInteger h = num/1;
    
    if ( h >= 8 && h < 20 ) {
        [self.delegate theShopIsOpen:YES];
    }else{
        [self.delegate theShopIsOpen:NO];
    }
}

-(void)timeString:(UILabel *)label
{
    _currentLength=self.sliderButton.center.x-0;
    float num=(_currentLength/_totalLength)*24.0;
    NSInteger h = num/1;
    NSInteger m = (num-h)*60;
    
    label.text=[NSString stringWithFormat:@"%.2ld:%.2ld",(long)h,(long)m];
    
}

-(void)nowTimePosizition:(UILabel * )label
{
    //    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    //    df.dateFormat = @"HH:mm";
    //    NSDate * date=[[NSDate alloc]init];
    //    date=[df dateFromString:label.text];
    NSLog(@"%@",label.text);
    NSArray * array = [label.text componentsSeparatedByString:@":"];
    NSLog(@"%f",[array[0] floatValue]);
    float time = [array[0] floatValue] * 60 + [array[1] floatValue];
    float totalTime = ( float) 24 * 60;
    float percent = time / totalTime;
    self.sliderButton.center = CGPointMake((self.bounds.size.width-0) * percent, self.sliderButton.center.y);
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
