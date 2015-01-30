//
//  FirstIntroduceTableCell.h
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/29.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstIntroduceTableCell : UITableViewCell

@property (nonatomic, assign) int articleCount;
@property (weak, nonatomic) IBOutlet UITableView *introduceTableView;



@end
