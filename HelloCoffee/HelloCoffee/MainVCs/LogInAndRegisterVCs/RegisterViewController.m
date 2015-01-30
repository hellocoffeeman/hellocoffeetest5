//
//  RegisterViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/19.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "RegisterViewController.h"
#import "LabelFieldView.h"

#define kLFWidth s_width/1.3
#define kLFHeight s_width/4.9
#define kLeftLabelHeight s_width/6.85
#define kFieldFontSize 16.0


@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet LabelFieldView *phoneNumberLF;
@property (weak, nonatomic) IBOutlet LabelFieldView *authCodeLF;
@property (weak, nonatomic) IBOutlet LabelFieldView *nickNameLF;
@property (weak, nonatomic) IBOutlet LabelFieldView *passwordLF;
@property (weak, nonatomic) IBOutlet LabelFieldView *confirmPasswordLF;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@property (weak, nonatomic) IBOutlet UILabel *declarationLabel;
@property (weak, nonatomic) IBOutlet UIButton *declarationButton;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self makeNavWithTitleLabel:@"新用户注册" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    
    
    //  - 视图控件 -
    [self setSubviewsFrame];
    
    [self.phoneNumberLF setLeftLabelWithWidth:70.0 labelHeight:kLeftLabelHeight labelText:@"手机号" rightPlaceholder:@"请输入手机号" rightFontSize:kFieldFontSize delegate:self];
    [self.authCodeLF setLeftLabelWithWidth:70.0 labelHeight:kLeftLabelHeight labelText:@"验证码" fieldFontSize:kFieldFontSize delegate:self rightButtonAction:@selector(getAuthCodeAction:)];
    [self.nickNameLF setLeftLabelWithWidth:80.0 labelHeight:kLeftLabelHeight labelText:@"用户昵称" rightPlaceholder:nil rightFontSize:kFieldFontSize delegate:self];
    [self.passwordLF setLeftLabelWithWidth:70.0 labelHeight:kLeftLabelHeight labelText:@"密码" rightPlaceholder:nil rightFontSize:kFieldFontSize delegate:self];
    [self.confirmPasswordLF setLeftLabelWithWidth:80.0 labelHeight:kLeftLabelHeight labelText:@"确认密码" rightPlaceholder:nil rightFontSize:kFieldFontSize delegate:self];
    
    
}

#pragma mark - SubView Frame -
-(void)setSubviewsFrame
{
    for (int i = 0; i < 5; i++ ) {
        LabelFieldView *lf_view = (LabelFieldView *)[self.view viewWithTag:2000+i];
        lf_view.frame = CGRectMake((s_width-kLFWidth)/2-10, (kLFHeight*i)+64, kLFWidth+10, kLFHeight);
    }
    
    self.registerButton.frame = CGRectMake((s_width-kLFWidth)/2, (kLFHeight*5)+64+(s_width/8.5), kLFWidth, s_width/8);
    self.declarationLabel.center = CGPointMake((s_width/2)-69, self.registerButton.frame.origin.y+30+s_width/7);
    self.declarationButton.center = CGPointMake((s_width/2)+74, self.registerButton.frame.origin.y+30+s_width/7);
    
}

#pragma mark -
#pragma mark - Action -
-(void) getAuthCodeAction:(UIButton *)button
{
    
}

- (IBAction)finishRegistAction:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark - TextField -
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:self.passwordLF.rightTextField] || [textField isEqual:self.confirmPasswordLF.rightTextField]) {
        
        [self.view bringSubviewToFront:self.navBackView];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.view.frame = CGRectMake(0, -170, s_width, s_height);
//        self.navBackView.frame = CGRectMake(0, 170, s_width, 64);
        self.backCleanView.frame = CGRectMake(0, 170, s_width, 64);
        [UIView setAnimationDelegate:self];
        [UIView commitAnimations];
        
    }else {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.view.frame = CGRectMake(0, 0, s_width, s_height);
//        self.navBackView.frame = CGRectMake(0, 0, s_width, 64);
        self.backCleanView.frame = CGRectMake(0, 0, s_width, 64);
        [UIView setAnimationDelegate:self];
        [UIView commitAnimations];
    }
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.view.frame = CGRectMake(0, 0, s_width, s_height);
//    self.navBackView.frame = CGRectMake(0, 0, s_width, 64);
    self.backCleanView.frame = CGRectMake(0, 0, s_width, 64);
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
