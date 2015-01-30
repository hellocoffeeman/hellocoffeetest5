//
//  SearchMainCell.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/9.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchMainCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *searchImg;
@property (weak, nonatomic) IBOutlet UILabel *imgLabel;


-(void)setSomethingWith:(NSString*)imageArr AndLabel:(NSString*)labelText;
@end
