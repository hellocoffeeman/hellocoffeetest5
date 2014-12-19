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
#import "BlueHeaderView.h" // Header View

//跳转的页面
#import "personSelf.h"
#import "MapViewController.h"
#import "ReserveViewController.h"
#import "PhotoViewController.h"
#import <MapKit/MapKit.h>



@interface ShopDetailsViewController ()<UITableViewDataSource,UITableViewDelegate>

#pragma mark - 数据 -
@property (nonatomic, strong) NSMutableArray *topPhotoArray; // 顶部 单店相册


#pragma mark - 视图控件 -
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, strong) ReserveButtonView *reserveButtonView;
// 更换 Department
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIButton *leftPartButton;
@property (nonatomic, strong) UIButton *rightPartButton;

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
    self.topPhotoArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"lunbo1"],[UIImage imageNamed:@"lunbo2"],[UIImage imageNamed:@"lunbo3"],[UIImage imageNamed:@"lunbo4"], nil];
    
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

#pragma mark - TableView  -

#pragma mark - TableView Cell -
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
        
        switch (indexPath.section) {
            case 0:
            {
                TopPicturesCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"TopPicturesCell" owner:self options:nil]lastObject];
                [cell setScrollViewDelegate:self imageArray:self.topPhotoArray target:self scrollViewAction:@selector(topScrollViewAction:)];
                [cell addTarget:self changeDepartmentAction:@selector(changeDepartmentAction:)];
                
                if (self.leftPartButton) {
                    BOOL isLeftPart = self.leftPartButton.selected;
                    cell.leftPartButton.selected = isLeftPart;
                    cell.rightPartButton.selected = !isLeftPart;
                    if (isLeftPart == YES ) {
                        cell.blueView.center = CGPointMake(s_width/2-97, s_width/1.875+25);
                    }
                    else{
                        cell.blueView.center = CGPointMake(s_width/2+42, s_width/1.875+25);
                    }
                }else{
                    cell.leftPartButton.selected = YES;
                }
                self.blueView = cell.blueView;
                self.leftPartButton = cell.leftPartButton;
                self.rightPartButton = cell.rightPartButton;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
                break;
            case 1:
            {
                if (self.leftPartButton.selected == YES) {
                    FirstIntroduceCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"FirstIntroduceCell" owner:self options:nil]lastObject];
                    [cell setPortraitImage:nil title:nil introduce:nil nickName:nil honorString:nil];
                    [cell addTarget:self withHeadPortraitIVAction:@selector(FirstHeadPortraitIVAction:) introduceLabelAction:@selector(FirstIntroduceLabelAction:) praiseButtonAction:@selector(FirstPraiseButtonAction:)];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    return cell;
                }else{
                    // 地图 Section
                    ThirdShopInfoCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"ThirdShopInfoCell" owner:self options:nil]lastObject];
                    [cell setInformationWithSomething];
                    [cell addTarget:self withAddressLabelAction:@selector(ThirdAddressLabelAction:) headPortraitImageView:@selector(ThirdHeadPortraitIVAction:)];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    return cell;
                }
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
                EndInterestedCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"EndInterestedCell" owner:self options:nil]lastObject];
                // 得到 image Array
                NSArray *imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"kenengganxingquderen-touxiang1.png"],[UIImage imageNamed:@"touxiang.png"], nil];
                [cell setInformationWithPortraitImagesArray:imageArray];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.leftPartButton.selected == YES || !self.leftPartButton) {
        return 4;
    }
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 判断
    if ([tableView isEqual:self.mainTableView]) {
        if (section == 1 && (self.leftPartButton.selected == YES || !self.leftPartButton)) {
            return 2; // 文章数 
        }
        return 1;
    }else{
        return 2; // 评论数 0、1、2
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;

    // 判断
    if ([tableView isEqual:self.mainTableView]) {
        
        switch (indexPath.section) {
            case 0:
                height = s_width/1.875 + 45;
                break;
            case 1:
            {
//                if (self.leftPartButton.selected == YES) height = 255;
                if (self.leftPartButton.selected == YES) height = (s_width-10)/1.275 + 10;
//                else height = 560;
                else height = s_width/1.875 + 15 + (s_width-10)*1.23;
            }
                break;
            case 2:
//                height = 255;
                height = (s_width-10)/1.26 + 10;
                break;
            case 3:
                height = 76;
                break;
            default:
                break;
        }
        
    }else{
        
//        height = 120;
        height = (s_width-15)/1.26/2;
    }
    
    return height;
}
#pragma mark - TableView section -

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) return 0.0;
    return 35;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) return 0.0;
    return 30;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) return nil;
    NSString *headerTltle;
    if (self.leftPartButton.selected == YES) {
        NSArray *array = @[@"",@"推荐",@"评论",@"可能感兴趣的小伙伴"];
        headerTltle = array[section];
    }else{
        headerTltle = @"店铺";
    }
    
    BlueHeaderView *blueHeaderView = [[BlueHeaderView alloc] initWithFrame:CGRectMake(0, 0, s_width, 35) title:headerTltle showCommentCountButton:NO target:nil commentCountButtonAction:nil];
    blueHeaderView.backgroundColor = [UIColor whiteColor];
    
    
    return blueHeaderView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) return nil;

    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, s_width, 10)];
    footerView.backgroundColor = [UIColor whiteColor];
    
    UIView *blueLineView = [[UIView alloc] initWithFrame:CGRectMake(s_width/2, 5, s_width/2, 1)];
    blueLineView.backgroundColor = kBlueColor;
    [footerView addSubview:blueLineView];
    
    return footerView;
}
#pragma mark - Scroll -
// 去掉 Tableview header/foooter view 黏性(sticky)
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    
//    CGFloat sectionHeaderHeight = 35;
////    CGFloat sectionFooterHeight = 30;
//
//    if (scrollView.contentOffset.y<=sectionHeaderHeight && scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    }
//    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//    
//    if (scrollView.contentOffset.y >= sectionHeaderHeight)
//    {
//        scrollView.contentInset = UIEdgeInsetsMake(0, 0, -sectionHeaderHeight, 0);
//    }
//
//}

#pragma mark - - Action - -

#pragma mark - TopPicturesCell -
// 跳转 PhotoVC
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

// 更换 Department
-(void) changeDepartmentAction:(UIButton *)button
{
    BOOL isLeftPart = [button isEqual:self.leftPartButton];

    self.leftPartButton.selected = isLeftPart;
    self.rightPartButton.selected = !isLeftPart;
    

    [self.mainTableView reloadData];
    
//    if (isLeftPart == YES ) {
//        self.blueView.center = CGPointMake(s_width/2-97, s_width/1.875+25);
//    }else{
//        self.blueView.center = CGPointMake(s_width/2+42, s_width/1.875+25);
//    }
//    NSLog(@"2 Button =====  isLeftPart = %d  =====",isLeftPart);

}

#pragma mark - FirstIntroduceCell -

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

#pragma mark - ThirdShopInfoCell -
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

#pragma mark - 预定 -
-(void)reserveButtonViewAction:(id)sender{
    
    ReserveViewController *reserveVC = [[ReserveViewController alloc]init];
    reserveVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:reserveVC animated:YES];
//    [MobClick event:@"buyStepOne"];
    
    NSLog(@" ReserveButtonViewAction ");
}

#pragma mark - 辅助方法 -

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
