//
//  search.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "search.h"
#import "httpManager.h"
@interface search ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation search

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.searchBar.delegate = self;
    self.tableView.hidden = YES;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
 
   
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"%@",searchText);
    if (searchText.length >0) {
        self.tableView.hidden = NO;
    }
//    智能搜索时向后台发起请求
    
//    [httpManager requestWithUrl:<#(NSString *)#> FinishBlock:^(NSData *data) {
//    
//    } FailedBlock:^{
//        
//    }];
    
//下面的reloadData应该放在完成请求后
    [self.tableView reloadData];
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    self.tableView.hidden = YES;
    NSLog(@"%@",self.searchBar.text);
//    向服务器发送请求
    
    
    
}

#pragma mark tableView的代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"search"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"search"];
        
    }
    
    cell.textLabel.text = self.searchBar.text;
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)findWhatIWant:(id)sender {
    
    
}
@end
