//
//  LoginViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/21.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPasswordViewController.h"
//#import "UMSocialWechatHandler.h"
#import "UMSocial.h"

#define kViewWidth (s_width/1.29)
#define kViewHeight (s_width/8)
#define kView_X ((s_width-s_width/1.29)/2)

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *backImageview;
@property (weak, nonatomic) IBOutlet UIImageView *coffeeLogo;

@property (weak, nonatomic) IBOutlet UIImageView *whiteImageview;
@property (weak, nonatomic) IBOutlet UIView *segmentView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageview;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageview;
@property (weak, nonatomic) IBOutlet UITextField *photoTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *or_imageview;
@property (weak, nonatomic) IBOutlet UILabel *or_Label;
@property (weak, nonatomic) IBOutlet UIButton *weibo_loginButton;
@property (weak, nonatomic) IBOutlet UIButton *weixin_loginButton;

@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;



@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //  - 视图控件 -
    [self setSubviewsFrame];
    self.photoTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    
}

#pragma mark - Set Frame -
-(void) setSubviewsFrame
{
    [self.view sendSubviewToBack:self.whiteImageview];
    
    // - 背景图 -
    self.backImageview.frame = self.view.bounds;
    [self.view sendSubviewToBack:self.backImageview];
    
    // - 返回 Btn -
    
    
    // - 咖啡杯 Logo -
    self.coffeeLogo.frame = CGRectMake((s_width-s_width/4.383)/2, s_width/3.368, s_width/4.383, s_width/5.423);
    
    // - 白框背景 -
    self.whiteImageview.frame = CGRectMake(kView_X, s_width/1.48, kViewWidth, kViewHeight*2);
    
    // - 图标/分割线 -
    self.segmentView.frame = CGRectMake(kView_X, s_width/1.48+kViewHeight, kViewWidth, 1);
    self.photoImageview.center = CGPointMake(kView_X+20, self.whiteImageview.center.y-kViewHeight/2);
    self.passwordImageview.center = CGPointMake(kView_X+20, self.whiteImageview.center.y+kViewHeight/2);
    
    // - 输入框 -
    self.photoTextField.frame = CGRectMake(kView_X+45, self.photoImageview.frame.origin.y, kViewWidth-60, 22);
    self.passwordTextField.frame = CGRectMake(kView_X+45, self.passwordImageview.frame.origin.y, kViewWidth-60, 22);
    
    // - 登陆 -
    self.loginButton.frame = CGRectMake(kView_X, s_width/1.01, kViewWidth, kViewHeight);
    self.weibo_loginButton.frame = CGRectMake(kView_X, s_width/0.775, kViewWidth, kViewHeight);
    self.weixin_loginButton.frame = CGRectMake(kView_X, s_width/0.691, kViewWidth, kViewHeight);
    
    // - 或 -
    self.or_imageview.frame = CGRectMake(s_width/5.33, s_width/0.84, s_width/1.6, 1);
    self.or_Label.center = self.or_imageview.center;
    
    // - 找回密码/注册 -
    self.forgotPasswordButton.frame = CGRectMake(kView_X, s_width/0.614, 80, 25);
    self.registerButton.frame = CGRectMake(s_width-80-kView_X, s_width/0.614, 80, 25);
    
    // 文字下划线
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:self.registerButton.titleLabel.text];
    NSRange contentRange = {0,[content length]};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    
    self.registerButton.titleLabel.attributedText = content;
    
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


#pragma mark -
#pragma mark - Button Action -
- (IBAction)backAction:(UIButton *)sender {
   
    [self.navigationController popViewControllerAnimated:YES
     ];
}

- (IBAction)loginAction:(UIButton *)sender {
    
    
}

- (IBAction)weiboLoginAction:(UIButton *)sender {
    
    //    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    //    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
    //        NSLog(@"新浪返回结果 is %@",response);
    //    });
    //    //设置回调对象
    //    [UMSocialControllerService defaultControllerService].socialUIDelegate = self;
    
    //    BOOL login = [UMSocialAccountManager isOauthAndTokenNotExpired:UMShareToSina];
    //    if (!login)
    //    {
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess){
            //获取微博用户名、uid、token等
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            NSLog(@"username is %@, uid is %@, token is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken);
            //self.XLdenglu.text =snsAccount.userName;
        }
    });
//    }
//    else{
//
//    }
}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

- (IBAction)weixinLoginAction:(UIButton *)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
                NSLog(@"response is %@",response);
//        self.WXdenglu.text = [[response.data objectForKey:@"wxsession"]objectForKey:@"username"];
    });
    //设置回调对象
//    [UMSocialControllerService defaultControllerService].socialUIDelegate = self;
    
    //得到的数据在回调Block对象形参respone的data属性
    //    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToWechatSession  completion:^(UMSocialResponseEntity *response){
    //        NSLog(@"SnsInformation is %@",response.data);
    //    }];
}

- (IBAction)forgetPasswordAction:(UIButton *)sender {
    
    ForgetPasswordViewController *forgetPassword = [[ForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:forgetPassword animated:YES];
}

- (IBAction)registerAction:(UIButton *)sender {
    
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
    
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
