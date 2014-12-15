//
//  SearchMainCell.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/9.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "SearchMainCell.h"

@implementation SearchMainCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setSomethingWith:(NSString*)imageArr AndLabel:(NSString*)labelText{
    self.searchImg.image = [UIImage imageNamed:imageArr];
    self.imgLabel.text = labelText;
    
}
@end
