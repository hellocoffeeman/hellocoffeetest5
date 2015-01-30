//
//  personSelf.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/4.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "personSelf.h"
#import "PersonMessageVC.h"
#import "PersonSettingVC.h"
#import "LoginViewController.h"

#import "SeachFriendCollectionViewCell.h"
#import "PersonCollectShopCell.h"
#import "ChangeSelfViewController.h"
#import "FriendSeachViewController.h"

#import "DianZanViewController.h"
#import "PublishArticleViewController.h"

static CGFloat mul;
@interface personSelf ()<UICollectionViewDelegate,UICollectionViewDataSource,changeSelfVCDelegate,UIActionSheetDelegate>
{
    int _numSelcect;
    NSArray *_arr3 ;
    BOOL _upDpwn;
    UIPanGestureRecognizer *_pan;
}
- (IBAction)setting:(id)sender;

- (IBAction)personMessage:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
//@property (weak, nonatomic) IBOutlet UILabel *jainjie;//个人简介

//@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIButton *xiugaiziliao;//修改资料
@property (weak, nonatomic) IBOutlet UIButton *xinxi;//信息

@property (weak, nonatomic) IBOutlet UIView *mainView;

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;


// 数据
@property (nonatomic, strong) NSArray *shopImageURL;

@property (nonatomic, strong) NSArray *nickNameArray;
@property (nonatomic, strong) NSArray *infoArray;

@end

@implementation personSelf

- (void)viewDidLoad {
    
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.mainCollectionView.backgroundColor = kBackColor;
    self.view.backgroundColor = kBackColor;
    [self makeBtn:@"1"];
    [self makeView];
    //    [self headImgAdd];
    if (self.title != nil) {
        [self makeNavWithTitleLabel:self.title withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    }
    
    // 注册
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"PersonCollectShopCell" bundle:nil] forCellWithReuseIdentifier:@"PersonCollectShopCell"];
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"SeachFriendCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SeachFriendCollectionViewCell"];

    
    
    _upDpwn = NO;
    _arr3 = @[@"touxiang60-60-1",@"touxiang60-60-2",@"touxiang60-60-3",@"touxiang60-60-4",@"touxiang60-60-5",@"touxiang60-60-6",@"touxiang60-60-2",@"touxiang60-60-3",@"touxiang60-60-4",@"touxiang60-60-5"];
    
    [super viewDidLoad];
    _numSelcect = 0;
    
    // 头像
    [self.portraitBtn setPortraitImage:[UIImage imageNamed:@"touxiang1"] borderWidth:s_width/68 hadIdentityImgV:NO identityType:0 identityImageSize:CGSizeZero target:self clickAction:@selector(portraitBtnAction:)];
    
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.delegate = self;
    
    _pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.mainCollectionView addGestureRecognizer:_pan];
    
    self.fabulabel.textColor = kBlueColor;
    self.fabuNum.textColor = kBlueColor;
    
    
    // - 数据 -
    self.nickNameArray = @[@"老布不拉柴围爾",@"云之遥",@"想咬我你必须有牙",@"我是白雪公主的外婆",@"真柳粥糊",@"Guardian Angel",@"狼牙"];
    self.infoArray = @[@"一段情,繪生命真彩;一杯茶,品人生沈浮;",@"骑着小毛驴带你环游世界。。",@"一生跟你走|爱就爱到底，无论风和雨，我只会前行不会回头",@"只有奋斗，只有拼搏，才会达到成功的彼岸。",@"人一定要受过伤才会沉默专注，无论是心灵或肉体上的创伤，对成长都有益处。",@"平常心,過萬千世界;舍名利,聞伴耳絲竹;",@"忍一时风平浪静，退一步海阔天空！"];
    
}

-(CGRect)CGchangeMake:(CGRect)fra
{
    CGRect rect;
    rect.origin.x = fra.origin.x *mul;
    rect.origin.y = fra.origin.y * mul;
    rect.size.width = fra.size.width*mul;
    rect.size.height = fra.size.height * mul;
    
    return rect;
}

-(void)makeView
{
    if (s_width <= 320) {
        mul = 0.777;
    }else if (s_width == 375){
        mul = 0.91;
    }else{
        mul = 1.0;
    }
    
    
    self.mainView.frame =[self CGchangeMake:self.mainView.frame];
//    NSLog(@"%f",self.backGroudImg.frame.size.width);
    self.backGroudImg.frame = [self CGchangeMake:self.backGroudImg.frame];
//     NSLog(@"%f",self.backGroudImg.frame.size.width);
    self.portraitBtn.frame = [self CGchangeMake:self.portraitBtn.frame];
    self.nameLable.frame = [self CGchangeMake:self.nameLable.frame];
//    self.jainjie.frame = [self CGchangeMake:self.jainjie.frame];
//    self.view1.frame = [self CGchangeMake:self.view1.frame];
    self.xiugaiziliao.frame = [self CGchangeMake:self.xiugaiziliao.frame];
    self.xinxi.frame = [self CGchangeMake:self.xinxi.frame];
//    self.fourBtnBackgroundImg.frame = [self CGchangeMake:self.fourBtnBackgroundImg.frame];
    self.touxianLabel.frame = [self CGchangeMake:self.touxianLabel.frame];
    self.fabulabel.frame = [self CGchangeMake:self.fabulabel.frame];
//    [self.fabulabel adjustsFontSizeToFitWidth];
    self.fabuNum.frame = [self CGchangeMake:self.fabuNum.frame];
    self.guanzhuLablel.frame = [self CGchangeMake:self.guanzhuLablel.frame];
    self.guanzhuNum.frame = [self CGchangeMake:self.guanzhuNum.frame];
    self.fensiLabel.frame = [self CGchangeMake:self.fensiLabel.frame];
    self.fensiNum.frame = [self CGchangeMake:self.fensiNum.frame];
    self.diazanLabel.frame = [self CGchangeMake:self.diazanLabel.frame];
    self.dianzanNum.frame =[self CGchangeMake:self.dianzanNum.frame];
    
    self.btn1.frame =[self CGchangeMake:self.btn1.frame];
    self.btn2.frame =[self CGchangeMake:self.btn2.frame];
    self.btn3.frame =[self CGchangeMake:self.btn3.frame];
    self.btn4.frame =[self CGchangeMake:self.btn4.frame];
    
    self.mainCollectionView.frame = [self CGchangeMake:self.mainCollectionView.frame];
    
}

#pragma mark -
#pragma mark 按钮设置
-(void)makeBtn:(NSString*)num
{
//    uibu
    self.btn1.clipsToBounds = YES;
    self.btn2.clipsToBounds = YES;
    self.btn3.clipsToBounds = YES;
    NSArray *btnArr = @[self.btn1,self.btn2,self.btn3,self.btn4];
    NSArray *labelArr = @[self.fabulabel,self.guanzhuLablel,self.fensiLabel,self.diazanLabel];
    NSArray *labelNumArr = @[self.fabuNum,self.guanzhuNum,self.fensiNum,self.dianzanNum];
    num =@"1";
    float j=3.0;
    
    {
    self.diazanLabel.text = @"";
    self.dianzanNum.text = @"";
    self.btn4.frame = CGRectMake(-100, -100, 0, 0);
    }
    
    for (int i = 0; i < j; i++) {
        
       
        [btnArr[i] setFrame:CGRectMake((414.0/j)*i, 305, 414.0/j, 66)];
//        NSLog(@"%f",btnArr[i] );
//        NSLog(@"%f",self.btn1.frame.size.width);
        [labelArr[i] setFrame:CGRectMake(414.0/j*i, 338, 414.0/j, 23)];
        [labelNumArr[i] setFrame:CGRectMake(414.0/j*i, 315, 414.0/j, 23)];
//        if (i == j-1) {
//            return;
//        }
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake((self.btn1.frame.size.width-1)*mul, 0, 1, 66)];
        [btnArr[i] addSubview:view];
        view.backgroundColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0];
        
        
        
    }
}

-(void)pan:(UIPanGestureRecognizer*)pan
{
    CGPoint point = [pan translationInView:self.view];
    //    NSLog(@"%f",point.y);
    //设置其实位置
    if (self.mainView.frame.size.height + self.mainView.frame.origin.y >85  && _upDpwn == NO) {
        if(point.y < -10 ){
            [UIView animateWithDuration:0.5 animations:^{
                self.mainView.center = CGPointMake( self.mainView.center.x,  self.mainView.center.y-236*mul);
                self.mainCollectionView.center = CGPointMake( self.mainCollectionView.center.x,  self.mainCollectionView.center.y-236*mul);

                self.nameLable.alpha = 0;
                self.touxianLabel.alpha=0;
                _upDpwn = YES;
                //            [self.tableView removeGestureRecognizer:_pan];
            }];
            
            [pan setTranslation:CGPointZero inView:self.view];
            return;
            
        }
       
    }
    
    if (_upDpwn == YES) {
        [self.mainCollectionView removeGestureRecognizer:_pan];
        
    }
   
}

-(void)viewWillAppear:(BOOL)animated
{
    if (self.title == nil) {
        self.navigationController.navigationBarHidden = YES;
        self.tabBarController.tabBar.hidden = NO;
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    if (self.title == nil) {
        self.navigationController.navigationBarHidden = YES;
        self.tabBarController.tabBar.hidden = NO;
    }else
    {
    self.tabBarController.tabBar.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Scroll View -
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    NSLog(@"%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y < -50 && _upDpwn == YES) {
        _upDpwn = NO;
        [UIView animateWithDuration:1.0 animations:^{
            self.mainView.center = CGPointMake( self.mainView.center.x,  self.mainView.center.y+236*mul);
            self.mainCollectionView.center = CGPointMake( self.mainCollectionView.center.x,  self.mainCollectionView.center.y+236*mul);
            self.nameLable.alpha = 1.0;
            self.touxianLabel.alpha=1.0;
            [self.mainCollectionView addGestureRecognizer:_pan];
            //                        [self.tableView removeGestureRecognizer:_pan];
        }];
        
    }
    
}

#pragma mark -
#pragma mark - Collection View -
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (_numSelcect) {
        case 0: return 3;
            break;
        default: return 7;
            break;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_numSelcect) {
        case 0: return CGSizeMake((s_width-30)/2, (s_width-30)/2);
            break;
        default: return CGSizeMake(s_width, s_width/4);
            break;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    switch (_numSelcect) {
        case 0:
        {
            PersonCollectShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PersonCollectShopCell" forIndexPath:indexPath];
            // 填充内容
            return cell;
        }
            break;
        case 1:
        {
            SeachFriendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SeachFriendCollectionViewCell" forIndexPath:indexPath];
            [cell setPortraitImgURL:[NSString stringWithFormat:@"touxiang60-60-%d",arc4random()%5+1] titleString:self.nickNameArray[arc4random()%6+1] infoString:self.infoArray[arc4random()%6+1] Target:self action:@selector(addOrCancelAttention:)];
            cell.funcButton.selected = YES;
            return cell;
        }
            break;
        case 2:
        {
            SeachFriendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SeachFriendCollectionViewCell" forIndexPath:indexPath];
            [cell setPortraitImgURL:[NSString stringWithFormat:@"touxiang60-60-%d",arc4random()%5+1] titleString:self.nickNameArray[arc4random()%6+1] infoString:self.infoArray[arc4random()%6+1] Target:self action:@selector(addOrCancelAttention:)];
            cell.funcButton.selected = NO;
            return cell;
        }
            break;
        default: return nil;
            break;
    }    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    switch (_numSelcect) {
        case 0: return UIEdgeInsetsMake(10, 10, 10, 10);
            break;
        default: return UIEdgeInsetsMake(0, 0, 0, 0);
            break;
    }
    
    
}


#pragma mark -
#pragma mark - Button Action -

-(void)portraitBtnAction:(UIButton *)button
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"更改头像",@"修改个人信息",nil];
    sheet.tag = 2000;
    [sheet showInView:self.view];
    
}

- (IBAction)setting:(id)sender {
    
    // 跳转 Seting界面
    PersonSettingVC *personSettingVC = [[PersonSettingVC alloc]init];
    personSettingVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:personSettingVC animated:YES];
}

- (IBAction)personMessage:(id)sender {
    
    NSLog(@"寻找好友！");
    
    FriendSeachViewController *friend=[[FriendSeachViewController alloc] init];
    friend.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:friend animated:YES];
}

- (IBAction)fabu:(id)sender {
    NSLog(@"发布");
    _numSelcect = 0;
    [self makeLabelColor];
    self.fabulabel.textColor = RGB(51, 136, 255);
    self.fabuNum.textColor = RGB(51, 136, 255);
    [self.mainCollectionView reloadData];
}

- (IBAction)guanzhu:(id)sender {
    NSLog(@"关注");
    _numSelcect = 1;
    [self makeLabelColor];
    self.guanzhuLablel.textColor = RGB(51, 136, 255);
    self.guanzhuNum.textColor = RGB(51, 136, 255);
    [self.mainCollectionView reloadData];
}

- (IBAction)fensi:(id)sender {
    NSLog(@"粉丝");
    _numSelcect = 2;
    [self makeLabelColor];
    self.fensiLabel.textColor = RGB(51, 136, 255);
    self.fensiNum.textColor = RGB(51, 136, 255);
    [self.mainCollectionView reloadData];
}

- (IBAction)dianzan:(id)sender {
    NSLog(@"点赞");
    _numSelcect = 3;
    [self makeLabelColor];
    self.dianzanNum.textColor = RGB(51, 136, 255);
    self.diazanLabel.textColor = RGB(51, 136, 255);
    [self.mainCollectionView reloadData];
}

- (IBAction)xiugaiziliao:(id)sender {
    NSLog(@"修改资料");
    
    /* 跳转登陆 */
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    loginVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginVC animated:YES];
    
}

- (IBAction)xinxiClick:(id)sender {
//    信息跳转
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"查看评论",@"查看发布",nil];
    sheet.tag = 2001;
    [sheet showInView:self.view];
//    PersonMessageVC *VC = [[PersonMessageVC alloc]init];
//    [self.navigationController pushViewController:VC animated:YES];
}

-(void)addOrCancelAttention:(UIButton *)button
{
    button.selected = !button.selected;
}

-(void)makeLabelColor
{
    self.fabulabel.textColor = [UIColor lightGrayColor];
    self.fabuNum.textColor = [UIColor lightGrayColor];
    self.guanzhuLablel.textColor = [UIColor lightGrayColor];
    self.guanzhuNum.textColor = [UIColor lightGrayColor];
    self.fensiLabel.textColor = [UIColor lightGrayColor];
    self.fensiNum.textColor = [UIColor lightGrayColor];
    self.dianzanNum.textColor = [UIColor lightGrayColor];
    self.diazanLabel.textColor = [UIColor lightGrayColor];
}

#pragma mark -
#pragma mark - Action Sheet -
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
   // NSLog(@"buttonIndex=====%ld",buttonIndex);
    // 头像 ActionSheet
    if (actionSheet.tag == 2000) {
        if (buttonIndex == 0) {
            
            [self openPhotoCamera]; // 打开相机
            
        }else if (buttonIndex == 1){
            ChangeSelfViewController *change=[[ChangeSelfViewController alloc] init];
            change.delegate = self;
            change.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:change animated:YES];
        }
    }
    
    // 更多 ActionSheet
    else if (actionSheet.tag == 2001){
        if (buttonIndex == 0) {
            DianZanViewController *dianZan = [[DianZanViewController alloc]init];
            dianZan.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:dianZan animated:YES];
        }else if (buttonIndex == 1){
            PublishArticleViewController *publish = [[PublishArticleViewController alloc]init];
            publish.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:publish animated:YES];
        }
    }
}

#pragma mark - Photo Picker -
-(void)openPhotoCamera
{
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];//初始化
    pickerVC.delegate = self;
    pickerVC.allowsEditing = YES;//设置可编辑
    
//    if(TARGET_IPHONE_SIMULATOR) {
        pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    }
//    else{
//        pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
//    }
    
    [self presentViewController:pickerVC animated:YES completion:nil];//进入照相界面
}
#pragma mark -
#pragma mark - Photo Picker -
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.portraitBtn.portraitImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark  changeSelfVCDelegate set方法的实现
-(void)set
{
    NSLog(@"set 实现了，提交修改过的个人信息");
}

@end
