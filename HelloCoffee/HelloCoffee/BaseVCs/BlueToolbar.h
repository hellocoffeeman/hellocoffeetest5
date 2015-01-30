//
//  BlueToolbar.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/8.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlueToolbar : UIToolbar
{
    
        UILabel *_titleLabel;
    
    NSString *_title;
    id _target;
    SEL _backAction;
}

+(UIToolbar*)shareToolBarWithSuperView:(UIView*)view withTitle:(NSString*)title withTarget:(id)target withBackAction:(SEL)backAction;

@end
