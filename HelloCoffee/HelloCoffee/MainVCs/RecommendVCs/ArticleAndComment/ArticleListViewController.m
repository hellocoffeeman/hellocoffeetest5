//
//  ArticleListViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/14.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "ArticleListViewController.h"
#import "ArticleListCell.h"
#import "CreatArticleViewController.h"
//#import "DemoViewController.h"  //富文本
#import "ArticleDetailViewController.h"

@interface ArticleListViewController ()

// 控件
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;

// 数据
@property (nonatomic,strong) NSArray *portraitArray;
@property (nonatomic,strong) NSArray *nickNameArray;
@property (nonatomic,strong) NSArray *articleImageArray;
@property (nonatomic,strong) NSArray *articleTitleArray;

@end

@implementation ArticleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self makeNavWithTitleLabel:@"文章列表" withRightBtn:YES rightButtonTitle:nil rightBtnImageURL:@"top_share.png" target:self rightBtnAction:@selector(creatNewArticleAction:)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = kBackColor;

    // - 试图控件 -
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"ArticleListCell" bundle:nil] forCellWithReuseIdentifier:@"ArticleListCell"]; // 注册
    
    UIImageView *endImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, s_width/2.645, s_width/35.556)];
    endImageView.center = CGPointMake(s_width/2, s_height-s_width/6.4);
    endImageView.image = [UIImage imageNamed:@"end.png"];
    [self.view insertSubview:endImageView atIndex:0];
    
    //  - 数据 -
    [self initBaseData];
    
}

#pragma mark - init Data -
-(void)initBaseData
{
    self.articleImageArray = @[@"111.jpg",@"444.jpg",@"222.jpg",@"604.JPG"];
    self.articleTitleArray = @[@"16mm--电影主题咖啡馆",@"当咖啡遇上榴莲",@"谜森林の咖啡厅",@"点一杯咖啡 燃烧孤独"];
    self.portraitArray =@[@"touxiang60-60-4.png", @"touxiang.png", @"touxiang8.png", @"touxiang60-60-6.png"];
    self.nickNameArray = @[@"by 老布不拉柴围爾 美食编辑 15-01-03",@"by 云之遥 美食编辑 15-01-01",@"by 想咬我你必须有牙 美食编辑 14-12-25",@"by 我是白雪公主的外婆 美食 编辑 14-11-12"];
    
}


#pragma mark -
#pragma mark - Collection View Delegate -
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.articleTitleArray.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(s_width-16, s_width/kArticleListRatio);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ArticleListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArticleListCell" forIndexPath:indexPath];
    [cell setArticleImageURL:self.articleImageArray[indexPath.row] articleTitle:self.articleTitleArray[indexPath.row] portraitImageUrl:self.portraitArray[indexPath.row] nickName:self.nickNameArray[indexPath.row]];
    NSLog(@" - %@ - ",NSStringFromCGRect(cell.bounds));

    return cell;
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(8, 5, 5, 8);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ArticleDetailViewController *articleDetailVC = [[ArticleDetailViewController alloc] init];
    [self.navigationController pushViewController:articleDetailVC animated:YES];
    
    NSLog(@" Select Item - %d",(int)indexPath.row);
}


#pragma mark - Creat New Article -
-(void)creatNewArticleAction:(UIButton *)button
{
    // 跳转 创建文章 页面
//    CreatArticleViewController *creatArticleVC = [[CreatArticleViewController alloc] init];
//    DemoViewController *creatArticleVC = [[DemoViewController alloc]init];
//    [self.navigationController pushViewController:creatArticleVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
