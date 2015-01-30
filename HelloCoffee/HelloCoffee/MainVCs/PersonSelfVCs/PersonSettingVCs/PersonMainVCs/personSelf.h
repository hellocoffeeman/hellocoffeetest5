//
//  personSelf.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//


#import "BaseViewController.h" 
#import "PortraitImageButton.h"

@interface personSelf : BaseViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
- (IBAction)fabu:(id)sender;
- (IBAction)guanzhu:(id)sender;
- (IBAction)fensi:(id)sender;
- (IBAction)dianzan:(id)sender;

- (IBAction)xiugaiziliao:(id)sender;
- (IBAction)xinxiClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *backGroudImg;//背景图
@property (weak, nonatomic) IBOutlet PortraitImageButton *portraitBtn;//头像

@property (weak, nonatomic) IBOutlet UIButton *zuoshangBtn;
@property (weak, nonatomic) IBOutlet UIButton *youshangBtn;
//

@property (weak, nonatomic) IBOutlet UILabel *fabulabel;
@property (weak, nonatomic) IBOutlet UILabel *fabuNum;
@property (weak, nonatomic) IBOutlet UILabel *guanzhuLablel;
@property (weak, nonatomic) IBOutlet UILabel *guanzhuNum;
@property (weak, nonatomic) IBOutlet UILabel *fensiLabel;
@property (weak, nonatomic) IBOutlet UILabel *fensiNum;
@property (weak, nonatomic) IBOutlet UILabel *diazanLabel;
@property (weak, nonatomic) IBOutlet UILabel *dianzanNum;
//

@property (weak, nonatomic) IBOutlet UILabel *touxianLabel;
//@property (weak, nonatomic) IBOutlet UIView *BtnView;




@end
