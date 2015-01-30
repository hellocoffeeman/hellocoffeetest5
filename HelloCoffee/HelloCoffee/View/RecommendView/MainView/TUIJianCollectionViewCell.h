//
//  TUIJianCollectionViewCell.h
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/4.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PortraitImageButton.h"
@interface TUIJianCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backView;
@property (weak, nonatomic) IBOutlet PortraitImageButton *tuoXiang;
@property (weak, nonatomic) IBOutlet UILabel *headText;
@property (weak, nonatomic) IBOutlet UILabel *detailText;
@property (weak, nonatomic) IBOutlet UIButton *DianzanXin;
@property (weak, nonatomic) IBOutlet UIButton *zanShu;
//@property (weak, nonatomic) IBOutlet UIImageView *zanview;
@property (weak, nonatomic) IBOutlet UIImageView *xinImg;
@property(nonatomic,assign)BOOL isZan;
@property (weak, nonatomic) IBOutlet UIButton *zengJian;

- (IBAction)zanDianDown:(id)sender;

@property(nonatomic,assign)BOOL isLoading;
- (IBAction)touXiangDown:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *pingCount;

@property(nonatomic,assign) id target;
@property(nonatomic,assign)SEL method;

@end
