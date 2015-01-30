//
//  LabelFieldView.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/16.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "LabelFieldView.h"

#define kLabelFontSize 17.0
#define kUploadButtonWidth ((s_width-60)/5)
#define kUploadButtonHeight (((s_width-60)/5)/1.12)

@interface LabelFieldView ()

@property (nonatomic, assign) CGFloat uploadBtn_Y;

@end

@implementation LabelFieldView

#pragma mark - 左 Label / 右 LabelText -
-(void) setLeftLabelWithWidth:(CGFloat)labelWidth labelHeight:(CGFloat)labelHeight labelText:(NSString *)labelText rightPlaceholder:(NSString *)placeholder rightFontSize:(CGFloat)rightFontSize delegate:(id)delegate
{
    self.backgroundColor = [UIColor whiteColor];
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    
    // 左 Label
    self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, height-labelHeight-1, labelWidth, height-1)];
    self.leftLabel.text = labelText;
    self.leftLabel.font = [UIFont systemFontOfSize:kLabelFontSize];
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.leftLabel];
    
    // 右 TextField
    CGFloat textField_X = self.leftLabel.bounds.size.width;
    self.rightTextField = [[UITextField alloc] initWithFrame:CGRectMake(10 + textField_X, height-labelHeight-1, width - labelWidth - 30, height)];
    self.rightTextField.font = [UIFont systemFontOfSize:rightFontSize];
    self.rightTextField.placeholder = placeholder;
    self.rightTextField.textAlignment = NSTextAlignmentLeft;
    self.rightTextField.delegate = delegate;
    [self addSubview:self.rightTextField];

    // 底部 分界线
    self.segmentView = [[UIView alloc] initWithFrame:CGRectMake(10, height-1, width-10, 1)];
    self.segmentView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.segmentView];
    
    
}
#pragma mark - 左 Label / 中 button / 右 button -

-(void) setLeftLabelWithWidth:(CGFloat)labelWidth labelHeight:(CGFloat)labelHeight labelText:(NSString *)labelText buttonTarget:(id)target centerBtnAction:(SEL)centerBtnAction rightBtnAction:(SEL)rightBtnAction
{
    self.backgroundColor = [UIColor whiteColor];
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    CGFloat btn_width = (width - 30 - labelWidth)/2 ;
    
    // 左 Label
    self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, height-labelHeight-1, labelWidth, height-1)];
    self.leftLabel.text = labelText;
    self.leftLabel.font = [UIFont systemFontOfSize:kLabelFontSize];
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.leftLabel];
    
    // 中 Button
    self.centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.centerButton.frame = CGRectMake(width-20-btn_width*2, 0, btn_width*0.8, labelHeight);
    [self.centerButton setTitle:@"市" forState:UIControlStateNormal];
    [self.centerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.centerButton.titleLabel.font = [UIFont systemFontOfSize:kLabelFontSize];
    [self.centerButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [self.centerButton addTarget:target action:centerBtnAction forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.centerButton];
    
    
    // 右 Button
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(width-20-btn_width*1.2, 0, btn_width*1.2, labelHeight);
    [self.rightButton setTitle:@"区/县" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:kLabelFontSize];
    [self.rightButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [self.rightButton addTarget:target action:rightBtnAction forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.rightButton];
    
    
    // 底部 分界线
    self.segmentView = [[UIView alloc] initWithFrame:CGRectMake(10, height-1, width-10, 1)];
    self.segmentView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.segmentView];
}

#pragma mark - 左 Label ； 中 ImageView ； 右 button -
-(void) setLeftLabelWithWidth:(CGFloat)labelWidth labelHeight:(CGFloat)labelHeight labelText:(NSString *)labelText rightButtonTarget:(id)target action:(SEL)action
{
    
    self.backgroundColor = [UIColor whiteColor];
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    
    // 左 Label
    self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, height-labelHeight-1, labelWidth, height-1)];
    self.leftLabel.text = labelText;
    self.leftLabel.font = [UIFont systemFontOfSize:kLabelFontSize];
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.leftLabel];
    
    // 中 ImageView
    self.rightImgV = [[UIImageView alloc] initWithFrame:CGRectMake(s_width-labelHeight-44-10, 5, labelHeight, labelHeight-10)];
    [self addSubview:self.rightImgV];
    
    // 右 Button
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(s_width - 50, labelHeight/2-22, 44, 44);
    [self.rightButton setImage:[UIImage imageNamed:@"camera_icon"] forState:UIControlStateNormal];
    [self.rightButton addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.rightButton];

    
    // 底部 分界线
    self.segmentView = [[UIView alloc] initWithFrame:CGRectMake(10, height-1, width-10, 1)];
    self.segmentView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.segmentView];
}

#pragma mark - 上 Label / 下 Button -

-(void) setLabelWithHeight:(CGFloat)labelHeight labelText:(NSString *)labelText addImageButtonTarget:(id)target action:(SEL)action
{
    self.uploadCount = 0;
    self.backgroundColor = [UIColor whiteColor];
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;

    // 左 Label
    self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, labelHeight)];
    self.leftLabel.text = labelText;
    self.leftLabel.font = [UIFont systemFontOfSize:kLabelFontSize];
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.leftLabel];
    
    // 下 Button
    self.uploadBtn_Y = labelHeight;
    UIButton *uploadImgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    uploadImgButton.frame = CGRectMake(10, self.uploadBtn_Y , kUploadButtonWidth, kUploadButtonHeight);
    uploadImgButton.tag = 2000 + self.uploadCount; // Tag
    [uploadImgButton setBackgroundImage:[UIImage imageNamed:@"add_img_bg"] forState:UIControlStateNormal];
    [uploadImgButton addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    [self addSubview:uploadImgButton];
    
    // 底部 分界线
    self.segmentView = [[UIView alloc] initWithFrame:CGRectMake(10, height-1, width-10, 1)];
    self.segmentView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.segmentView];
}

-(void) addOneMoreUploadButtonWithTarget:(id)target action:(SEL)action
{
    if (self.uploadCount >= 5) {
        return;
    }
    
    self.uploadCount++ ;
    
    UIButton *uploadImgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    uploadImgButton.frame = CGRectMake(10 + self.uploadCount*(kUploadButtonWidth+10), self.uploadBtn_Y, kUploadButtonWidth, kUploadButtonHeight);
    uploadImgButton.tag = 2000 + self.uploadCount; // Tag
    [uploadImgButton setBackgroundImage:[UIImage imageNamed:@"add_img_bg"] forState:UIControlStateNormal];
    [uploadImgButton addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    [self addSubview:uploadImgButton];
    
}

#pragma mark - 左 Label ； 中 TextField ； 右 button -
-(void) setLeftLabelWithWidth:(CGFloat)labelWidth labelHeight:(CGFloat)labelHeight labelText:(NSString *)labelText fieldFontSize:(CGFloat)fieldFontSize delegate:(id)delegate rightButtonAction:(SEL)rightButtonAction
{
    
    self.backgroundColor = [UIColor whiteColor];
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    
    // 左 Label
    self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, height-labelHeight-1, labelWidth, height-1)];
    self.leftLabel.text = labelText;
    self.leftLabel.font = [UIFont systemFontOfSize:kLabelFontSize];
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.leftLabel];
    
    // 中 TextField
    CGFloat textField_X = self.leftLabel.bounds.size.width;
    self.rightTextField = [[UITextField alloc] initWithFrame:CGRectMake(10 + textField_X, height-labelHeight-1, 65, height)];
    self.rightTextField.font = [UIFont systemFontOfSize:fieldFontSize];
    self.rightTextField.textAlignment = NSTextAlignmentLeft;
    self.rightTextField.delegate = delegate;
    [self addSubview:self.rightTextField];
    
    // 右 Button
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(width-(s_width/4.05), height-(s_width/11.85)-(s_width/62), (s_width/4.05), (s_width/11.85));
    [self.rightButton setImage:[UIImage imageNamed:@"verification_code_but"] forState:UIControlStateNormal];
    [self.rightButton addTarget:delegate action:rightButtonAction forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.rightButton];
    
    // 底部 分界线
    self.segmentView = [[UIView alloc] initWithFrame:CGRectMake(10, height-1, width-10, 1)];
    self.segmentView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.segmentView];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
