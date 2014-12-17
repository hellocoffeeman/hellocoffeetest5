//
//  WantSeachViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/14.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "WantSeachViewController.h"
#import "SeachTopicsCell.h"
#import "recommend.h"
//#import "BlueToolbar.h"
//#import "EGORefreshTableHeaderView.h"

@interface WantSeachViewController ()<UIScrollViewDelegate>
{
    BOOL _pullup;//上拉
}
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property(nonatomic,strong)NSArray *BusinessDistrict;



@end

@implementation WantSeachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
//
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"SeachTopicsCell" bundle:nil] forCellWithReuseIdentifier:@"SeachTopicsCell"]; // 注册

//    系统的刷新
//    [self makeRefresh];
    
    [self.mainCollectionView addSubview:[self makeRefresh]];
    
    // 判断显示类型
    switch (self.type) {
        case WantSight:
//            [self makeToolBar:@"情景"];
            [self makeNavWithTitleLabel:@"主题"];
            break;
        case WantType:
//            [self makeToolBar:@"商圈"];
            [self makeNavWithTitleLabel:@"商圈"];
            break;
        case WantActivity:
//            [self makeToolBar:@"活动"];
            [self makeNavWithTitleLabel:@"情景"];
            break;
        case WantPrise:
//            [self makeToolBar:@"单价"];
            [self makeNavWithTitleLabel:@"单价"];
            break;
        default:
            break;
    }
//    读取图片
    [self loadPic];

    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  -
-(void)loadPic
{
    if(self.type == WantSight){
        self.BusinessDistrict = @[@"juhuipaidui@2x",@"qinglvyuehui@2x",@"shangwuqiatan@2x",@"yonglanfangsong@2x"];
    }else if (self.type == WantType){

        self.BusinessDistrict = @[@"chaoyanggongyuan@2x",@"chongwenmen@2x",@"dawanglu@2x",@"dongdaqiao@2x",@"dongsi@2x",@"dongzhimen@2x",@"gongti@2x",@"gongzhufen@2x",@"guomao@2x",@"jinrongjie@2x"];
    }else if (self.type == WantActivity){

        self.BusinessDistrict =@[@"chongwu@2x",@"hutong@2x",@"jiudian@2x",@"ketang@2x",@"kuajie@2x",@"yinyue@2x"];
    }else if (self.type == WantPrise){
        self.BusinessDistrict =@[@"0~40",@"40~60",@"60~80",@"80+"];
    }
}


#pragma mark - Collection View Delegate -
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.BusinessDistrict.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((s_width-25)/2, ((s_width-25)/2)/1.5);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SeachTopicsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SeachTopicsCell" forIndexPath:indexPath];
    
    // 填充内容
    cell.mainImageView.image = [UIImage imageNamed:self.BusinessDistrict[indexPath.row]];
    
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    recommend *shop = [[recommend alloc]init];
    shop.state = @"1";
   self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shop animated:YES];
}

#pragma mark 刷新

-(void)refreshDown
{
    [_refreshControl beginRefreshing];
    NSLog(@"%d",_refreshControl.refreshing);
    _refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"正在刷新中。。。"] ;
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(refresh) userInfo:nil repeats:NO];

}
-(void)refresh
{

    //刷新结束
    [_refreshControl endRefreshing];
    self.BusinessDistrict = @[@"chaoyanggongyuan@2x",@"chongwenmen@2x",@"dawanglu@2x",@"dongdaqiao@2x",@"dongsi@2x",@"dongzhimen@2x",@"gongti@2x",@"gongzhufen@2x",@"guomao@2x",@"jinrongjie@2x"];
    [self.mainCollectionView reloadData];
    NSLog(@"%d",_refreshControl.refreshing);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

    _pullup = YES;
        if (_pullup && self.mainCollectionView.frame.size.height+self.mainCollectionView.contentOffset.y >self.mainCollectionView.contentSize.height + 50) {

            self.BusinessDistrict = @[@"chaoyanggongyuan@2x",@"chongwenmen@2x",@"dawanglu@2x",@"dongdaqiao@2x",@"dongsi@2x",@"dongzhimen@2x",@"gongti@2x",@"gongzhufen@2x",@"guomao@2x",@"jinrongjie@2x",@"jiuxianqiao@2x",@"wangfujing@2x",@"wangjing@2x",@"wudaokou@2x",@"wukesong@2x",@"xidan@2x",@"xizhimen@2x",@"yaao@2x",@"yansha@2x",@"zhongguancun@2x",];
            _pullup = NO;
            [self.mainCollectionView reloadData];
    
        }
}






@end
