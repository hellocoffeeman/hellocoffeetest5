//
//  ImageLabelButton.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/19.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    PraiseButton = 0,
    CheckButton
}Type;

@interface ImageLabelButton : UIButton

-(void) setText:(NSString *)text andTypy:(Type)type;

@end
