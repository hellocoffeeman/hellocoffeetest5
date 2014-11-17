//
//  search.h
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface search : UIViewController
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
- (IBAction)findWhatIWant:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
