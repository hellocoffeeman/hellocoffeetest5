//
//  ForgetPasswordViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/22.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "ResetPasswordViewController.h"
#import "LabelFieldView.h"

#define kLFWidth s_width/1.3
#define kLFHeight s_width/4.9
#define kLeftLabelHeight s_width/6.85
#define kFieldFontSize 16.0

@interface ForgetPasswordViewController ()
@property (weak, nonatomic) IBOutlet LabelFieldView *phoneNumberLF;
@property (weak, nonatomic) IBOutlet LabelFieldView *authCodeLF;
@property (weak, nonatomic) IBOutlet UIButton *nextStopButton;

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeNavWithTitleLabel:@"找回密码" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    
    //  - 视图控件 -
    [self setSubviewsFrame];
    
    [self.phoneNumberLF setLeftLabelWithWidth:70.0 labelHeight:kLeftLabelHeight labelText:@"手机号" rightPlaceholder:@"请输入手机号" rightFontSize:kFieldFontSize delegate:self];
    [self.authCodeLF setLeftLabelWithWidth:70.0 labelHeight:kLeftLabelHeight labelText:@"验证码" fieldFontSize:kFieldFontSize delegate:self rightButtonAction:@selector(getAuthCodeAction:)];
    

}

#pragma mark -
#pragma mark - SubView Frame -
-(void)setSubviewsFrame
{
    self.phoneNumberLF.frame = CGRectMake((s_width-kLFWidth)/2-10, 64, kLFWidth+10, kLFHeight);
    self.authCodeLF.frame = CGRectMake((s_width-kLFWidth)/2-10, kLFHeight+64, kLFWidth+10, kLFHeight);
    self.nextStopButton.center = CGPointMake(s_width/2, s_width/1.05);
}

- (IBAction)nextStopAction:(UIButton *)sender {
    
    ResetPasswordViewController *resetPasswordVC = [[ResetPasswordViewController alloc] init];
    [self.navigationController pushViewController:resetPasswordVC animated:YES];
}

#pragma mark -
#pragma mark - Action -
-(void) getAuthCodeAction:(UIButton *)button
{
    
}


#pragma mark -
#pragma mark - TextField -
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
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
