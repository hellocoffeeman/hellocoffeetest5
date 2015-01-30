//
//  EmailBondViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/30.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "EmailBondViewController.h"

@interface EmailBondViewController ()

// 控件
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UITextField *nickTextField;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *bondingButton;

@property (nonatomic, assign) CGFloat haveChangeY;

@end

@implementation EmailBondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeNavWithTitleLabel:@"邮箱绑定" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];

//
//    self.navigationItem.title = @"邮箱绑定";
//    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
//    
//    // 设置 返回本界面的 Title / Color
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    self.navigationItem.backBarButtonItem = backItem;
//    backItem.title = @" ";
    
    //  - 视图控件 -
    self.nickTextField.delegate = self;
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = YES;
//}


#pragma mark -
#pragma mark - UITextField Delegate -
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self.view bringSubviewToFront:self.navBackView];
    
    CGFloat changeY = 0;
    if ([textField isEqual:self.nickTextField]) {
        changeY = 0;
    }else if ([textField isEqual:self.emailTextField]){
        changeY = 60000/s_height/2;
    }else if ([textField isEqual:self.passwordTextField]){
        changeY = 60000/s_height;
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    self.view.frame = CGRectMake(0, -changeY, s_width, s_height);
//    self.navBackView.frame = CGRectMake(0, changeY, s_width, 64);
    self.backCleanView.frame = CGRectMake(0, changeY, s_width, 64);
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
#pragma mark - Bond Action -
- (IBAction)bondAction:(UIButton *)sender {
    
    
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
