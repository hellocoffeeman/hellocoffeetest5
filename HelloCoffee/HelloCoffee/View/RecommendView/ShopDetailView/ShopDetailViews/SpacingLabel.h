//
//  SpacingLabel.h
//  CharacterSpacingTest
//
//  Created by hellocoffee2 on 15/1/7.
//  Copyright (c) 2015年 hellocoffee2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpacingLabel : UILabel
@property(nonatomic,assign) CGFloat characterSpacing;
@property(nonatomic,assign) long    linesSpacing;
@property(nonatomic,assign) long    paragraphSpacing;

/*
 *绘制前获取label高度
 */
- (int)getAttributedStringHeightWidthValue:(int)width;

@end
