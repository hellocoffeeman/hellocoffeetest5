//
//  HistrorySeachCollectionViewCell.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/20.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "HistrorySeachCollectionViewCell.h"

@implementation HistrorySeachCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor=[UIColor whiteColor];
}

- (IBAction)btnDown:(id)sender {
    [self.taget  performSelector:@selector(danDeteDown:) withObject:@(self.row)];
}
@end
