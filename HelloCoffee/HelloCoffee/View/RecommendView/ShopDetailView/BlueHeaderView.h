//
//  BlueHeaderView.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/17.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlueHeaderView : UIView


-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title showCommentCountButton:(BOOL)showCommentCountButton target:(id)target commentCountButtonAction:(SEL)commentCountButtonAction;

@end
