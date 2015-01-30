//
//  ChangeSelfViewController.h
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/20.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "BaseViewController.h"

@protocol changeSelfVCDelegate <NSObject>

-(void)set;

@end

@interface ChangeSelfViewController : BaseViewController

@property(nonatomic,strong)UIImageView *headImg;


@property(nonatomic,strong)UITextField *text1;
@property(nonatomic,strong)UITextField *text2;
@property(nonatomic,assign)id<changeSelfVCDelegate> delegate;

@end
