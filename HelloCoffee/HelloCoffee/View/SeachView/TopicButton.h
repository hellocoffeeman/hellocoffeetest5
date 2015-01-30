//
//  TopicButton.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/4.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicButton : UIButton

-(void) setBarkColor:(UIColor *)backColor leftImage:(UIImage *)leftImage titleString:(NSString *)titleString describeString:(NSString *)describeString targrt:(id)target action:(SEL)action;

@end
