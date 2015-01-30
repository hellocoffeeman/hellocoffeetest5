//
//  TalkVC.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/30.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "BaseViewController.h"

@interface TalkVC : BaseViewController

@property(nonatomic,copy)NSString *TitleName;
@property(nonatomic,strong)UIImage *image;

@property(nonatomic,strong)UIButton *luaghBtn;
@property(nonatomic,strong)UIButton *sendBtn;
@property(nonatomic,strong)UIImageView *inputImage;
@property(nonatomic,strong)UIImageView *dikuangImage;
@property(nonatomic,strong)UITextField *inputTextField;

//@property (weak, nonatomic) IBOutlet UIButton *laughBtn;
//@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
//@property (weak, nonatomic) IBOutlet UIImageView *inputImage;
//@property (weak, nonatomic) IBOutlet UITextField *inputTextField;


@end
