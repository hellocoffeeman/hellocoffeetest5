//
//  SuggestViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/31.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "SuggestViewController.h"
#define charLimit 140
@interface SuggestViewController ()

// 控件
@property (weak, nonatomic) IBOutlet UIImageView *backImageView_1;
@property (weak, nonatomic) IBOutlet UITextView *suggestTextView;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView_2;
@property (weak, nonatomic) IBOutlet UITextField *contactTextField;

@end

@implementation SuggestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeNavWithTitleLabel:@"意见反馈" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    
    //  - 视图控件 -
    self.suggestTextView.delegate = self;
    self.contactTextField.delegate = self;
    
    _JianYilab.text=@"感谢你使用Hello Coffee\n如果您对我们有什么建议，请再此留下宝贵的意见";
    [self isPhoneX];
//    // 监听键盘
//    // 键盘出现
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    // 键盘消失
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}
-(void)isPhoneX
{
  if(s_width==320)
  {
      _JianYilab.font=[UIFont systemFontOfSize:11];
  }else if(s_width==375)
  {
      _JianYilab.font=[UIFont systemFontOfSize:14];
  }
    else
    {
        _JianYilab.font=[UIFont systemFontOfSize:16];
    }
      
}
//#pragma mark -
//#pragma mark - 监听键盘 -
//- (void)keyboardWillShow:(NSNotification*)notification
//{
//    CGFloat changeY = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
//    [self changeSubviewsCenterWithChangeY:changeY upward:YES];
//}
//
//- (void)keyboardWillHide:(NSNotification*)notification
//{
//    CGFloat changeY = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
//    [self changeSubviewsCenterWithChangeY:changeY upward:NO];
//}

//-(void)viewWillAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = YES;
//}


#pragma mark - 修改 Center Y -
-(void)changeSubviewsCenterWithChangeY:(CGFloat)changeY upward:(BOOL)upward
{
//    if ([self.contactTextField isFirstResponder]) {
//        [self view:self.view changeY:changeY upward:upward];
//    }
//    [self view:self.backImageView_1 changeY:changeY upward:upward];
//    [self view:self.suggestTextView changeY:changeY upward:upward];
//    [self view:self.contactLabel changeY:changeY upward:upward];
//    [self view:self.contactTextField changeY:changeY upward:upward];
//    [self view:self.backImageView_2 changeY:changeY upward:upward];
}

//-(void)view:(UIView *)view changeY:(CGFloat)changeY upward:(BOOL)upward
//{
//    if (upward == YES) {
//        view.center = CGPointMake(view.center.x, view.center.y-changeY);
//    }else{
//        view.center = CGPointMake(view.center.x, view.center.y+changeY);
//    }
//}


#pragma mark -
#pragma mark - UITextView Delegate -
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSLog(@" - ShouldBeginEditing - ");
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    NSLog(@" - ShouldEndEditing - ");
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@" - DidBeginEditing - ");
    
    if ([textView.text isEqualToString:@"您的支持激励我们的成长"])
    {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }else{
        
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@" - DidEndEditing - text:%@",textView.text);
    
    if (textView.text.length == 0) {
        textView.text = @"您的支持激励我们的成长";
        textView.textColor = [UIColor lightGrayColor];
    }else{
        textView.textColor = [UIColor blackColor];
    }
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([@"\n" isEqualToString:text] == YES)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        self.view.frame = CGRectMake(0, 0, s_width, s_height);
//        self.navBackView.frame = CGRectMake(0, 0, s_width, 64);
        self.backCleanView.frame = CGRectMake(0, 0, s_width, 64);
        [UIView setAnimationDelegate:self];
        [UIView commitAnimations];
        
        if([textView.text length]>charLimit)
        {
            NSString *str=[NSString stringWithFormat:@"输入的文字超过%d",charLimit];
            UIAlertView *alter=[[UIAlertView alloc] initWithTitle:@"警告" message:str  delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alter show];
        }
        
        [textView resignFirstResponder];
        return NO;
    }else{
        return YES;
    }
}

//cancelButtonTitle为0
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    //NSLog(@"buttonIndex==%d",buttonIndex);
    NSString *str= _suggestTextView.text;
    _suggestTextView.text=[str substringWithRange:NSMakeRange(0, charLimit)];
}
- (void)textViewDidChange:(UITextView *)textView
{
    
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    return YES;
}

#pragma mark -
#pragma mark - UITextField Delegate -
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    self.view.frame = CGRectMake(0, -180, s_width, s_height);
//    self.navBackView.frame = CGRectMake(0, 180, s_width, 64);
    self.backCleanView.frame = CGRectMake(0, 180, s_width, 64);
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];

    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    self.view.frame = CGRectMake(0, 0, s_width, s_height);
//    self.navBackView.frame = CGRectMake(0, 0, s_width, 64);
    self.backCleanView.frame = CGRectMake(0, 0, s_width, 64);
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    [textField resignFirstResponder];
    return YES;
}


#pragma mark -

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
