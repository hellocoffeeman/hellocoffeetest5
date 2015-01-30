//
//  HistrorySeachCollectionViewCell.h
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/20.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistrorySeachCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
- (IBAction)btnDown:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;
@property(nonatomic,assign)id taget;
@property(nonatomic,assign)NSInteger row;
@property(nonatomic,assign)SEL sel;
@end
