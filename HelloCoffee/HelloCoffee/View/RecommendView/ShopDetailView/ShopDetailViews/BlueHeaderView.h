//
//  BlueHeaderView.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/17.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlueHeaderView : UIView


-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title leftImage:(UIImage *)leftImage;

-(void)setCommentButtonWithTarget:(id)target commentAction:(SEL)commentAction currentCount:(int)currentCount;

@end
