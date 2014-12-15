//
//  ChooseTimeSliderView.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/25.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChooseTimeSliderViewDelegate <NSObject>
@required
-(void)theShopIsOpen:(BOOL)isOpen;
@end

@interface ChooseTimeSliderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *borderImageView;
@property (weak, nonatomic) IBOutlet UIButton *sliderButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sliderLineIV;


@property (nonatomic, assign) id<ChooseTimeSliderViewDelegate> delegate; // 代理

-(void)setNowDateString:(NSString *)dateString timeString:(NSString *)timeString;

@end
