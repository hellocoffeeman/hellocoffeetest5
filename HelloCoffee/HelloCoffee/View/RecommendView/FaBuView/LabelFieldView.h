//
//  LabelFieldView.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/16.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelFieldView : UIView

@property (nonatomic, strong) UILabel *leftLabel; // 左 Label
@property (nonatomic, strong) UITextField *rightTextField; // 右 TextField
@property (nonatomic, strong) UIView *segmentView; // 底部 分界线

@property (nonatomic, strong) UIImageView *rightImgV; // 右 ImageView

@property (nonatomic, strong) UIButton *centerButton; // 中 Button
@property (nonatomic, strong) UIButton *rightButton; // 右 Button


@property (nonatomic, assign) int uploadCount; // 已上传数



// 1. 设置 左 Label ； 右 LabelText
-(void) setLeftLabelWithWidth:(CGFloat)labelWidth labelHeight:(CGFloat)labelHeight labelText:(NSString *)labelText rightPlaceholder:(NSString *)placeholder rightFontSize:(CGFloat)rightFontSize delegate:(id)delegate;

// 2. 设置 左 Label ； 中 button ； 右 button
-(void) setLeftLabelWithWidth:(CGFloat)labelWidth labelHeight:(CGFloat)labelHeight labelText:(NSString *)labelText buttonTarget:(id)target centerBtnAction:(SEL)centerBtnAction rightBtnAction:(SEL)rightBtnAction;

// 3. 设置 左 Label ； 中 ImageView ； 右 button
-(void) setLeftLabelWithWidth:(CGFloat)labelWidth labelHeight:(CGFloat)labelHeight labelText:(NSString *)labelText rightButtonTarget:(id)target action:(SEL)action;

// 4. 设置 上 Label ； 下 Button
-(void) setLabelWithHeight:(CGFloat)labelHeight labelText:(NSString *)labelText addImageButtonTarget:(id)target action:(SEL)action;

// 上传 下一张图片
-(void) addOneMoreUploadButtonWithTarget:(id)target action:(SEL)action;;

// 5. 设置 左 Label ； 中 TextField ； 右 button
-(void) setLeftLabelWithWidth:(CGFloat)labelWidth labelHeight:(CGFloat)labelHeight labelText:(NSString *)labelText fieldFontSize:(CGFloat)fieldFontSize delegate:(id)delegate rightButtonAction:(SEL)rightButtonAction;


@end
