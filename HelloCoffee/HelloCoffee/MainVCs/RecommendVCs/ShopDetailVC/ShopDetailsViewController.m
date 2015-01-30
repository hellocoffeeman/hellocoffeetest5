//
//  ShopDetailsViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/18.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "ShopDetailsViewController.h"

// 框架
#import <MapKit/MapKit.h>
// 跳转的页面
#import "personSelf.h"
#import "MapViewController.h"
#import "PhotoViewController.h"
#import "ArticleListViewController.h"
#import "ArticleDetailViewController.h"
#import "ShowFunctionView.h"
// 自定义 Cells
#import "TopPicturesCell.h"
#import "FirstIntroduceCell.h"
#import "ShopCommentCell.h"
#import "SecondCommentCell.h"
#import "ThirdShopInfoCell.h"
#import "EndInterestedCell.h"
// 自定义 视图
#import "BlueHeaderView.h" // Header View
#import "PingDetailViewController.h"
@interface ShopDetailsViewController ()<UITableViewDataSource,UITableViewDelegate>

#pragma mark - 数据 -
@property (nonatomic, strong) NSMutableArray *topPhotoArray; // 顶部 单店相册

//@property (nonatomic, strong) NSArray *portraitArray1; // 头像 Array
//@property (nonatomic, strong) NSArray *nickNameArray1; // 昵称 Array
//@property (nonatomic, strong) NSArray *articleDateArray1; // 文章日期 Array
//@property (nonatomic, strong) NSArray *articleTitleArray1; // 文章标题 Array
//@property (nonatomic, strong) NSArray *articleImageArray1; // 文章图片 Array

@property (nonatomic, strong) NSArray *nickNameArray2; // 昵称 Array
@property (nonatomic, strong) NSArray *commentArray2; // 评论 Array
@property (nonatomic, strong) NSArray *dateArray2; // 日期 Array

#pragma mark - 视图控件 -
@property (nonatomic, strong) PageScrollView *pageScrollView; // 保存 TopScrollView
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, strong) ShowFunctionView *showFuncView;
// 更换 Department
//@property (nonatomic, strong) BlueSelectButton *leftPartButton;
//@property (nonatomic, strong) BlueSelectButton *rightPartButton;

@end

@implementation ShopDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self makeNavWithTitleLabel:@"熊猫的家的咖啡" withRightBtn:YES rightButtonTitle:nil rightBtnImageURL:@"fenxiang.png" target:nil rightBtnAction:nil];
    
    [self creatNavigationSectionViewWithTarget:self sectionTitle1:@"热门" actionOne:@selector(changeDepartmentAction:) sectionTitle2:@"关于" actionTwo:@selector(changeDepartmentAction:) rightBtnImageURL:@"top_comment.png" rightBtnAction:@selector(presentCommentAction:) rightBtnTwoImageURL:@"top_share.png" rightBtnTwoAction:@selector(shareShopArticleAction:)];
    [self changeDepartmentAction:self.sectionBtn1];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //  - 数据 -
    [self initBaseData];
    
    //  - 视图控件 -
    // Main Table View
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.separatorColor = [UIColor clearColor];
    
    // 分享 收藏
    self.showFuncView = [[ShowFunctionView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.showFuncView];
    [self.view bringSubviewToFront:self.showFuncView];
    self.showFuncView.hidden = YES;
    
    // 手势
    self.showFuncView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(testAction)];
    [self.showFuncView addGestureRecognizer:tap];
    
}
-(void)testAction
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"单店详情"];
    //self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = YES;
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



#pragma mark - 初始化 数据 -
-(void)initBaseData
{
    // 相册 Array
    self.topPhotoArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"222.jpg"],[UIImage imageNamed:@"601.JPG"],[UIImage imageNamed:@"602.JPG"],[UIImage imageNamed:@"604.JPG"], nil];
    
    // 评论
    self.nickNameArray2 = @[@"老布不拉柴围爾",@"云之遥"];
    self.commentArray2 = @[@"环境真的不错哦 ! ! !  ",@"在逛街中偶然发现这家咖啡馆。\n奶茶中带有些清香的咖啡味，价钱还不高呢..."];
    self.dateArray2 = @[@"2015-01-03",@"2015-01-01"];
    
}


#pragma mark - TableView  -

#pragma mark - TableView Selecte -
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 判断
    if ([tableView isEqual:self.mainTableView]) {
        
        switch (indexPath.section) {
            case 1:
            {
                if (self.sectionBtn1.selected == YES && indexPath.row == 0) {
                    // 文章详情
                    NSLog(@"Select Article cell - %d ",(int)indexPath.row);
                    ArticleDetailViewController *articleDetailVC = [[ArticleDetailViewController alloc] init];
                    [self.navigationController pushViewController:articleDetailVC animated:YES];
                }
                else if (self.sectionBtn1.selected == NO && indexPath.row == 0) {
                    // 地图
                    NSLog(@"Select Map cell");
                    MapViewController *map = [[MapViewController alloc]init];
                    map.addr = @"北京大学";
                    [self.navigationController pushViewController:map animated:YES];
                }
            }
                break;
            default:
                break;
        }
    }
    else if (tableView.tag == 7002){
        
        // 评论
        NSLog(@"Select Comment cell");
        PingDetailViewController *ping=[[PingDetailViewController alloc] init];
        [self.navigationController pushViewController:ping animated:YES];
    }
}

#pragma mark - TableView Cell -
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 判断
    if ([tableView isEqual:self.mainTableView]) {
        
        switch (indexPath.section) {
            case 0:
            {
                TopPicturesCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"TopPicturesCell" owner:self options:nil]lastObject];
                [cell setScrollViewDelegate:self imageArray:self.topPhotoArray target:self scrollViewAction:@selector(topScrollViewAction:)];
                if (self.pageScrollView != nil) {
                    cell.pageScrollView.contentOffset = self.pageScrollView.contentOffset;
                }
                self.pageScrollView = cell.pageScrollView;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
                break;
            case 1:
            {
                if (self.sectionBtn1.selected == YES) {
                    // 来自推荐 - 美编文章
                    FirstIntroduceCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"FirstIntroduceCell" owner:self options:nil]lastObject];
                    [cell setShopImage:[UIImage imageNamed:@"111.jpg"] title:@"16mm--电影主题咖啡馆" nickName:@"by 老布不拉柴围爾 美食编辑" dateString:@"2015-01-03" praiseCount:arc4random()%999 buttonTarget:self shareAction:@selector(firstShareArticleAction:) praiseAction:@selector(firstPraiseArticleAction:) lookMoreAction:@selector(firstLookMoreArticleAction:)];
                    
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    return cell;
                    
                }else{
                    // 来自关于 - 地图/店铺信息
                    if (indexPath.row == 0) {
                        ThirdShopInfoCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"ShopAddressMapCell" owner:self options:nil]lastObject];
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        return cell;
                    }else{
                        ThirdShopInfoCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"ThirdShopInfoCell" owner:self options:nil]lastObject];
                        [cell setInformationWithSomething];
                        [cell addTarget:self withPortraitTouchAction:@selector(thirdHeadPortraitIVAction:) telLabelAction:@selector(thirdTelephoneLabelTouchAction:)];
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        return cell;
                    }
                }
            }
                break;
            case 2:
            {
                // 评论列表
                SecondCommentCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SecondCommentCell" owner:self options:nil]lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.commentTableView.scrollEnabled = NO;
                cell.commentTableView.dataSource = self;
                cell.commentTableView.delegate = self;
                cell.commentTableView.separatorColor = [UIColor clearColor];
                return cell;
            }
                break;
            case 3:
            {
                EndInterestedCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"EndInterestedCell" owner:self options:nil]lastObject];
                // 得到 image Array
                NSArray *imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"touxiang60-60-1"],[UIImage imageNamed:@"touxiang60-60-2"],[UIImage imageNamed:@"touxiang60-60-3"],[UIImage imageNamed:@"touxiang60-60-5"],[UIImage imageNamed:@"touxiang60-60-6"],[UIImage imageNamed:@"touxiang60-60-4"],[UIImage imageNamed:@"touxiang60-60-2"], nil];
                [cell setInformationWithPortraitImagesArray:imageArray addTarget:self withPortraitTouchAction:@selector(endInterestedPortraitAction:)];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
                break;
            default:
                return nil;// 错误
                break;
        }
    }
    else if (tableView.tag == 7002){
        // 评论
        ShopCommentCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"ShopCommentCell" owner:self options:nil]lastObject];
        [cell setInformationWithSomething];
        [cell setNickName:self.nickNameArray2[indexPath.row] commentString:self.commentArray2[indexPath.row] dateString:self.dateArray2[indexPath.row] replyCount:(arc4random()%30+1)+(int)(indexPath.row*30) target:self replyAction:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([tableView isEqual:self.mainTableView]) {
        if (self.sectionBtn1.selected == YES || !self.sectionBtn1) {
            return 4;
        }
        else return 2;
    }
    if (tableView.tag == 7002) {
        return 1; // 评论 Table
    }
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 判断
    if ([tableView isEqual:self.mainTableView]) {
        if (section == 1 && (self.sectionBtn1.selected == YES || !self.sectionBtn1)) {
            return 1; // 文章 Table
        }
        if (section == 1 && self.sectionBtn1.selected == NO) {
            return 2; // 地图 + 店铺信息
        }
        if (section == 2) {
            return 1; // 评论列表
        }
        return 1; // 其他
    }
    else if (tableView.tag == 7002){
        return self.commentArray2.count;
    }
    
    else return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    
    // 判断
    if ([tableView isEqual:self.mainTableView]) {
        
        switch (indexPath.section) {
            case 0:
                height = s_width/kTopPictureRatio; // 展示图片 + 分组按钮
                break;
            case 1:
            {
                if (self.sectionBtn1.selected == YES) {
                    // 来自推荐 - 文章表格
                    height = s_width/kFirstIntroduceRatio;
                }
                else {
                    // 来自关于 - 地图/店铺信息
                    if (indexPath.row == 0) {
                        height = s_width/kAddressMapRatio;
                    }else{
                        height = (s_width-10)/kThirdShopInfoRatio + 10;
                    }
                }
            }
                break;
            case 2:
            {
                CGFloat commentHeight = 0;
                for (int i = 0; i < self.commentArray2.count; i++) {
                    SpacingLabel *label = [[SpacingLabel alloc] init];
                    label.font = [UIFont systemFontOfSize:17.0];
                    label.text = self.commentArray2[i];
                    label.numberOfLines = 0;
                    label.linesSpacing = 6.0f;
                    commentHeight += [label getAttributedStringHeightWidthValue:s_width-40]*1.08;
                }
                height = (82*self.commentArray2.count) + commentHeight ;
            }
                break;
            case 3:
                height = s_width/kEndInterestedRatio+10;
                break;
            default:
                break;
        }
    }
    else if (tableView.tag == 7002){
        SpacingLabel *label = [[SpacingLabel alloc] init];
        label.font = [UIFont systemFontOfSize:17.0];
        label.text = self.commentArray2[indexPath.row];
        label.linesSpacing = 6.0f;
        height = [label getAttributedStringHeightWidthValue:s_width-40]*1.08 + 82;
    }
    
    return height;
}
#pragma mark - TableView section -

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) return 0.0;
    return s_width/kBlueHeaderRatio;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) return nil;
    NSString *headerTitle;
    if (self.sectionBtn1.selected == YES) {
        NSArray *titleArray = @[@"",@"来自推荐",@"来自评论",@"来自可能感兴趣的小伙伴"];
        headerTitle = titleArray[section];
    }else{
        headerTitle = @"W+SCAFF by Napoleon";
    }
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, s_width, s_width/kBlueHeaderRatio)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, s_width/kBlueHeaderRatio-25, s_width-40, 20)];
    headerLabel.text = headerTitle;
    if (self.sectionBtn1.selected == YES) {
        headerLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17.5];
        headerLabel.textColor = kBlueColor;
    }else{
        headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
        headerLabel.textColor = RGB(102, 102, 102);
    }
    [headerView addSubview:headerLabel];
    
    return headerView;
}


#pragma mark - - Action - -

#pragma mark - Navigation -
// 更换 Department
-(void) changeDepartmentAction:(UIButton *)button
{
    BOOL isLeftPart = [button isEqual:self.sectionBtn1];
    
    self.sectionBtn1.selected = isLeftPart;
    self.sectionBtn2.selected = !isLeftPart;
    self.sectionWhiteView.center = CGPointMake(button.center.x, self.sectionWhiteView.center.y);
    
    self.rightBtn.hidden = !isLeftPart;
    self.rightBtnTwo.hidden = isLeftPart;
    
    [self.mainTableView reloadData];
}
// 评论店铺
-(void)presentCommentAction:(UIButton *)button
{
    NSLog(@"Present Comment");
    [self.showFuncView showCommentView];
}
// 分享文章
-(void)shareShopArticleAction:(UIButton *)button
{
    NSLog(@"Share Shop Article");
    [self.showFuncView showShareFuncView];
}

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

#pragma mark - FirstArticleCell -

-(void)firstLookMoreArticleAction:(UIButton *)button
{
    NSLog(@"Select More Article Action");
    ArticleListViewController *articleListVC = [[ArticleListViewController alloc] init];
    [self.navigationController pushViewController:articleListVC animated:YES];
}

-(void)firstShareArticleAction:(UIButton *)button
{
    NSLog(@"Share Article Action");

}

-(void)firstPraiseArticleAction:(UIButton *)button
{
    NSLog(@"Praise Article Action");
    ImageButton *imageButton = (ImageButton *)button;
    if (imageButton.selected == NO) {
        imageButton.aTitleLabel.text = [NSString stringWithFormat:@"%d",imageButton.aTitleLabel.text.intValue + 1];
    }else{
        imageButton.aTitleLabel.text = [NSString stringWithFormat:@"%d",imageButton.aTitleLabel.text.intValue - 1];
    }
    imageButton.selected = !imageButton.selected;
}

#pragma mark - SecondCommentCell -
-(void)secondCommentCountAction:(UIButton *)button
{
    NSLog(@"SecondCommentCell CommentCountAction");
    // 跳转 查看所有评论/回复
    
}

#pragma mark - ThirdShopInfoCell -
-(void)thirdHeadPortraitIVAction:(id)sender
{
    NSLog(@" Third ShopPortraitIV Action ");
    // 进入店主的聊天或者店主的个人页
    personSelf *person = [[personSelf alloc]init];
    person.title = @"熊猫家的主人";
    [self.navigationController pushViewController:person animated:YES];
}

-(void)thirdTelephoneLabelTouchAction:(UILabel *)telLabel
{
    NSLog(@" Third TelephoneLabel Action ");
    // 调用 电话
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://13800138000"]];
}

#pragma mark - EndInterestedCell -
-(void)endInterestedPortraitAction:(UIButton *)button
{
    personSelf *person = [[personSelf alloc]init];
    person.title = @"榴莲遇上咖啡";
    [self.navigationController pushViewController:person animated:YES];
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
