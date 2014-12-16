//
//  ShopDetailsViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ShopDetailsViewController.h"

#import "TopPicturesCell.h" // 自定义 Cells
#import "FirstIntroduceCell.h"
#import "SecondCommentCell.h"
#import "ThirdShopInfoCell.h"
#import "EndInterestedCell.h"
#import "ShopCommentCell.h"

#import "ReserveButtonView.h" // 自定义 预定ButtonView

//跳转的页面
#import "personSelf.h"
#import "MapViewController.h"
#import "ReserveViewController.h"
#import "PhotoViewController.h"
#import <MapKit/MapKit.h>



@interface ShopDetailsViewController ()<UITableViewDataSource,UITableViewDelegate>

// 数据
@property (nonatomic, strong) NSMutableArray *topPhotoArray; // 顶部 单店相册


// 视图控件
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, strong) ReserveButtonView *reserveButtonView;

@end

@implementation ShopDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    self.navigationItem.title = @"熊猫的家的咖啡";

    // 设置 返回键 Title
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem = backItem;
    backItem.title = @" ";
    
    self.navigationController.navigationBarHidden = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //  - 数据 -
    
    // 相册 Array
    self.topPhotoArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"3"], nil];
    
    //  - 视图控件 -
    
    // Main Table View
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.separatorColor = [UIColor clearColor];
    
    // 自定义 预定ButtonView
    self.reserveButtonView = [[ReserveButtonView alloc] initWithFrame:CGRectMake(0, s_height-49, s_width, 49) buttonTarget:self buttonAction:@selector(reserveButtonViewAction:)];
    [self.view addSubview:self.reserveButtonView];
    NSLog(@"reserveButtonView = %@",NSStringFromCGRect(self.reserveButtonView.frame));
    
}
-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillDisappear:animated];
    [MobClick beginLogPageView:@"单店详情"];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"单店详情"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate -

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 判断
    if ([tableView isEqual:self.mainTableView]) {
        NSLog(@"Select Main cell");
    }else{
        NSLog(@"Select Comment cell");
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 判断
    if ([tableView isEqual:self.mainTableView]) {
        
        switch (indexPath.row) {
            case 0:
            {
                TopPicturesCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"TopPicturesCell" owner:self options:nil]lastObject];
                // 得到 image Array
                [cell setScrollViewDelegate:self imageArray:self.topPhotoArray target:self scrollViewAction:@selector(topScrollViewAction:)];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
                break;
            case 1:
            {
                FirstIntroduceCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"FirstIntroduceCell" owner:self options:nil]lastObject];
                [cell setInformationWithSomething];
                [cell addTarget:self withHeadPortraitIVAction:@selector(FirstHeadPortraitIVAction:) introduceLabelAction:@selector(FirstIntroduceLabelAction:) praiseButtonAction:@selector(FirstPraiseButtonAction:)];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
                break;
            case 2:
            {
                SecondCommentCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SecondCommentCell" owner:self options:nil]lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.commentTableView.scrollEnabled = NO;
                cell.commentTableView.separatorColor = [UIColor clearColor];
                cell.commentTableView.delegate = self;
                cell.commentTableView.dataSource = self;
                return cell;
            }
                break;
            case 3:
            {
                ThirdShopInfoCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"ThirdShopInfoCell" owner:self options:nil]lastObject];
                [cell setInformationWithSomething];
                [cell addTarget:self withAddressLabelAction:@selector(ThirdAddressLabelAction:) headPortraitImageView:@selector(ThirdHeadPortraitIVAction:)];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
                break;
            case 4:
            {
                EndInterestedCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"EndInterestedCell" owner:self options:nil]lastObject];
                // 得到 image Array
                NSArray *imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"kenengganxingquderen-touxiang1.png"],[UIImage imageNamed:@"touxiang.png"], nil];
                [cell setInformationWithPortraitImagesArray:imageArray];
                [cell addPlummetIVAction]; // 添加坠子的动画 [ 下拉、换图片 ]
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
                break;
            default:
                return nil;// 错误
                break;
        }
    }else{
        
        ShopCommentCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"ShopCommentCell" owner:self options:nil]lastObject];
        [cell setInformationWithSomething];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 判断
    if ([tableView isEqual:self.mainTableView]) {
        return 5; // 界面模块数
    }else{
        return 2; // 评论数 0、1、2
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;

    // 判断
    if ([tableView isEqual:self.mainTableView]) {
        
        switch (indexPath.row) {
            case 0:
                height = s_width/1.875;
                break;
            case 1:
//                height = 360;
                height = [self getNewSizeOfRectWithText:[NSString stringWithFormat:@"从高品质的咖啡豆到一杯完美的咖啡，我们致力于使其间每个程序与细节均尽善尽美，务求为顾客奉上风味纯正的最佳意式咖啡"] limitSize:CGSizeMake(s_width-88, 170) fontSize:17.0].height + 190;
                break;
            case 2:
                height = 290;
                break;
            case 3:
                height = 520;
                break;
            case 4:
                height = 110;
                break;
            default:
                break;
        }
        
    }else{
        
        height = 120;
    }
    
    return height;
}

#pragma mark - Cell上的 点击 -

// TopPicturesCell
-(void)topScrollViewAction:(id)sender
{
    NSLog(@" TopPicturesCell ScrollViewAction ");
    
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    UIScrollView *scrollView = (UIScrollView *)tap.view;
    
    // 跳转
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    photoVC.pictureArray = self.topPhotoArray;
    photoVC.currentPage = (int)scrollView.contentOffset.x/s_width;
    [self presentViewController:photoVC animated:YES completion:nil];
    
    
}

// FirstIntroduceCell
-(void)FirstHeadPortraitIVAction:(id)sender
{
    NSLog(@" FirstIntroduceCell HeadPortraitIVAction ");
//  --》  点击美食编辑头像 进图美食编辑的个人页
    
    personSelf *person = [[personSelf alloc]init];
    person.title = @"个人主页";
    [self.navigationController pushViewController:person animated:YES];
    
// 《--
}
-(void)FirstIntroduceLabelAction:(id)sender
{
    NSLog(@" FirstIntroduceCell IntroduceLabelAction ");
//跳转到编辑内容的详细信息页
    
//    
    

}
-(void)FirstPraiseButtonAction:(id)sender
{
    NSLog(@" FirstIntroduceCell PraiseButtonAction ");
//--》向服务器发起点赞信息
    
    
//《--

}

// ThirdShopInfoCell
-(void)ThirdAddressLabelAction:(id)sender
{
    NSLog(@" ThirdShopInfoCell addressLabelAction ");
//--》点击地图 进入地图页面
    MapViewController *map = [[MapViewController alloc]init];
    map.addr = @"北京大学";
    [self.navigationController pushViewController:map animated:YES];
//《--
    
    
}
-(void)ThirdHeadPortraitIVAction:(id)sender
{
    NSLog(@" ThirdShopInfoCell headPortraitIVAction ");
//    进入店主的聊天或者店主的个人页
    
}

// 预定
-(void)reserveButtonViewAction:(id)sender{
    
    ReserveViewController *reserveVC = [[ReserveViewController alloc]init];
    reserveVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:reserveVC animated:YES];
//    [MobClick event:@"buyStepOne"];
    
    NSLog(@" ReserveButtonViewAction ");
}

#pragma mark -  -

#pragma mark - 计算高度 -
-(CGSize)getNewSizeOfRectWithText:(NSString *)text limitSize:(CGSize)limitSize fontSize:(CGFloat)fontSize
{
    /* 文段、限制Size、字号 */
    
    NSDictionary *attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGRect rect = [text boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributeDic context:nil];
    
    return rect.size;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
