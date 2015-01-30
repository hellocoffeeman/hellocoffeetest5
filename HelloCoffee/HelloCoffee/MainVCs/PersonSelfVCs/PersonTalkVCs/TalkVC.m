//
//  TalkVC.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/12/30.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "TalkVC.h"
#import "ChatCell.h"
#import "ChatModel.h"
#import "TalkMoreVC.h"

@interface TalkVC ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView *_tableView;
//    UITextField *_textField;
    NSMutableArray *_dataArray;
    UIView *_chatView;
}
@end

@implementation TalkVC
//-(void)viewWillAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = YES;
//    self.navigationController.navigationBarHidden = YES;
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = NO;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    [self makeNavWithTitleLabel:self.TitleName withRightBtn:YES rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];

    self.rightBtn.hidden = NO;
    [self.rightBtn setTitle:@"更多" forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, s_width, s_width-64-57)];
    //隐藏分割线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
//    底框
    self.dikuangImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, s_height-57, s_width, 57)];
    [self.view addSubview:self.dikuangImage];
    self.dikuangImage.userInteractionEnabled = YES;
    self.dikuangImage.image = [UIImage imageNamed:@"wenzishurudikuang"];
//    笑脸按钮
    self.luaghBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.luaghBtn.frame = CGRectMake(0, 0, 57, 57);
    [self.luaghBtn setImage:[UIImage imageNamed:@"biaoqingtubiao"] forState:UIControlStateNormal];
    [self.luaghBtn addTarget:self action:@selector(luaghBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.dikuangImage addSubview:self.luaghBtn];
//    文字输入框
    self.inputImage = [[UIImageView alloc]initWithFrame:CGRectMake(57+10, 8, s_width-57-10-10-57, 40)];
    self.inputImage.image = [UIImage imageNamed:@"wenzishurukuang"];
    self.inputImage.userInteractionEnabled = YES;
    [self.dikuangImage addSubview:self.inputImage];
// textfield
    self.inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(5, 0, s_width-57-10-10-57-5, 35)];
    [self.inputImage addSubview:self.inputTextField];
    self.inputTextField.delegate = self;
    self.inputTextField.borderStyle = UITextBorderStyleNone;
    self.inputTextField.placeholder = @"请输入文字";
    [self.inputTextField addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
//    发送按钮
    self.sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sendBtn setImage:[UIImage imageNamed:@"fasong1"] forState:UIControlStateNormal];
    [self.sendBtn setImage:[UIImage imageNamed:@"fasong2"] forState:UIControlStateSelected];
    [self.sendBtn addTarget:self action:@selector(sendText) forControlEvents:UIControlEventTouchUpInside];
    self.sendBtn.frame = CGRectMake(s_width-57, 0, 57, 57);
    [self.dikuangImage addSubview:self.sendBtn];
    
    //监听键盘出现 通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //监听键盘消失
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}
- (void)keyboardWillShow:(NSNotification*)noti{
    //得到键盘的大小
    CGSize size = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    _tableView.frame = CGRectMake(0, 64, s_width, s_height - size.height-57-67);
    self.dikuangImage.frame = CGRectMake(0, s_height-size.height-57, s_width, 57);
//    _chatView.frame = CGRectMake(0, 440 - size.height, 320, 40);
}

//键盘消失
- (void)keyboardWillHide:(NSNotification*)noti{
    
}


#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChatModel* chatModel = [_dataArray objectAtIndex:indexPath.row];
    //计算所占宽高
    CGSize size = [chatModel.chatStr boundingRectWithSize:CGSizeMake(250, 1000) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0]} context:nil].size;
    return size.height + 15 + 10+10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChatCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[ChatCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    ChatModel* chatModel = [_dataArray objectAtIndex:indexPath.row];
    //计算所占宽高
    CGSize size = [chatModel.chatStr boundingRectWithSize:CGSizeMake(250, 1000) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0]} context:nil].size;
    
    if (chatModel.isSelf) {
        //自己发的
        cell.leftBubble.hidden = YES;
        cell.leftHeadImg.hidden = YES;
        cell.rightBubble.hidden = NO;
        cell.rightHeadImg.hidden = NO;
        cell.rightLabel.text = chatModel.chatStr;
        cell.rightLabel.frame = CGRectMake(10, 5, size.width, size.height);
        cell.rightBubble.frame = CGRectMake(s_width-70  - (size.width + 25), 20, size.width + 25, size.height + 15);
        cell.rightHeadImg.image = [UIImage imageNamed:@"touxiang60-60-6"];
        
    } else {
        //接收的
        cell.rightBubble.hidden = YES;
        cell.rightHeadImg.hidden = YES;
        cell.leftBubble.hidden = NO;
        cell.leftHeadImg.hidden = NO;
        cell.leftLabel.text = chatModel.chatStr;
        cell.leftLabel.frame = CGRectMake(15, 5, size.width, size.height);
        cell.leftBubble.frame = CGRectMake(70, 20, size.width + 25, size.height + 15);
        cell.leftHeadImg.image = self.image;
    }
    
    return cell;
}

#pragma mark BtnClick
//发送文本
- (void)sendText{
    if (self.sendBtn.selected == YES) {
    
    
    ChatModel* chatModel = [[ChatModel alloc] init];
    chatModel.chatStr = self.inputTextField.text;
    chatModel.isSelf = YES;
    self.inputTextField.text = @"";
    [_dataArray addObject:chatModel];
    
    //添加一行
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:_dataArray.count-1 inSection:0];
    [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //自动滑动到最后一行
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        self.sendBtn.selected = NO;
    //自动回复
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(autoSpeak) userInfo:nil repeats:NO];
    }else{
        
    }
}
//笑脸按钮
-(void)luaghBtnClick
{
    NSLog(@"笑脸按钮");
//    self.inputTextField.keyboardType = 
}



//自动回复
- (void)autoSpeak{
    NSArray* array = @[@"好的", @"没问题！", @"妥妥的！", @"去死！", @"一边去！"];
    
    ChatModel* chatModel = [[ChatModel alloc] init];
    chatModel.chatStr = array[arc4random()%array.count];
    chatModel.isSelf = NO;
    [_dataArray addObject:chatModel];

    //添加一行
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:_dataArray.count-1 inSection:0];
    [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //自动滑动到最后一行
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}





-(void)more
{
    NSLog(@"go to more");
    TalkMoreVC *talkMore = [[TalkMoreVC alloc]init];
    [self.navigationController pushViewController:talkMore animated:YES];
}

#pragma mark textField delegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//    NSLog(@"%ld",[[textField.text stringByAppendingString:string] length]);
//    if ([[textField.text stringByAppendingString:string] length]  >0 && self.sendBtn.selected == NO) {
//        self.sendBtn.selected = YES;
//        return YES;
//    }
//    if ([[textField.text stringByAppendingString:string] length]==1 && self.sendBtn.selected == YES) {
//        self.sendBtn.selected = NO;
//        return YES;
//    }
    return YES;
    
}
-(void)textFieldDidChanged:(UITextField*)textField
{
    NSLog(@"%ld",(unsigned long)[textField.text  length]);
    if ([textField.text  length]  >0 && self.sendBtn.selected == NO) {
        self.sendBtn.selected = YES;
        return ;
    }
    if ([textField.text length]==0 && self.sendBtn.selected == YES) {
        self.sendBtn.selected = NO;
        return ;
    }

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
