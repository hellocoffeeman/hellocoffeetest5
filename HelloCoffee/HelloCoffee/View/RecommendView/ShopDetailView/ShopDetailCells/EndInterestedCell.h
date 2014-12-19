//
//  EndInterestedCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndInterestedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *portraitIV1;
@property (weak, nonatomic) IBOutlet UIImageView *portraitIV2;
@property (weak, nonatomic) IBOutlet UIImageView *portraitIV3;
@property (weak, nonatomic) IBOutlet UIImageView *portraitIV4;
@property (weak, nonatomic) IBOutlet UIImageView *portraitIV5;

@property (nonatomic, strong) NSArray *portraitImagesArray;

// Cell 方法
-(void) setInformationWithPortraitImagesArray:(NSArray *)imagesArray; // 传入需要的参数

-(void)addPlummetIVAction; // 给Plummet添加方法





@end
