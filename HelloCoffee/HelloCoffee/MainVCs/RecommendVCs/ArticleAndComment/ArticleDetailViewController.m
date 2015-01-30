//
//  ArticleDetailViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 15/1/19.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "ArticleDetailViewController.h"
#import "PortraitImageButton.h"
#import "ArticleDetailTopCell.h"
#import "ArticleDetailCell.h"

@interface ArticleDetailViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;

// 数据
@property (nonatomic, strong) NSArray *paragraphArray;
@property (nonatomic, strong) NSArray *shopImgURLArray;

@end

@implementation ArticleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeNavWithTitleLabel:@"海岸咖啡&榴小莲" withRightBtn:nil rightButtonTitle:nil rightBtnImageURL:nil target:self rightBtnAction:nil];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // - 视图控件 -
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"ArticleDetailTopCell" bundle:nil] forCellWithReuseIdentifier:@"ArticleDetailTopCell"]; // 注册
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"ArticleDetailCell" bundle:nil] forCellWithReuseIdentifier:@"ArticleDetailCell"]; // 注册
    
    self.mainCollectionView.frame = CGRectMake(0, 64, s_width, s_height-64);
    //    self.mainCollectionView.backgroundColor = kBlueColor;
    //  - 数据 -
    [self initBaseData];
    
}

#pragma mark - Base Data -
-(void) initBaseData
{
    self.paragraphArray = @[@"      有一家咖啡馆，不仅贩卖咖啡，自己烘焙豆子，还生产咖啡器具。有一家甜品店，只做榴莲制品，每天限量卖完为止，还提供外送。这样两家店开在了一起。",@"     店长说海岸是由两个老板合伙经营的，一个开工厂专门制作咖啡相关器具，另一个主要做咖啡豆。所以海岸里所有的手冲咖啡设备都是自己工厂的，客人使用的咖啡壶包括橱窗里销售的都是订制出的产品。而咖啡豆更是讲究，老板精选新鲜咖啡豆，在店里自己烘焙，那台好似火车头一样的烘豆机就是镇店至宝。",@"      而这样一个咖啡馆里怎么会有家甜品店呢？店长笑说，机缘巧合下榴小莲入驻了海岸，这也算是一种复合式经营吧。榴小莲如其名，只做榴莲甜品，而且准确的说只做榴莲千层蛋糕。",@"      为了防止气味蔓延，每一个榴莲千层都独立的放在塑料盒中。打开塑料盒，榴莲浓烈的香气迅速侵略到你的鼻腔里，还没吃就已有了满足感。但第一眼看蛋糕的外形有些坍塌，貌似不太好看。而仔细观察蛋糕的外层，质感好像榴莲果肉的外皮一样，内部一层奶油一层果肉层次分明。为了让榴莲的口味最大化，店家减免了糖和面粉的使用，这就是为什么看起来坍塌的原因。"];
//    self.paragraphArray = @[@"店长说海岸是由两个老板合伙经营的，一个开工厂专门制作咖啡相关器具，另一个主要做咖啡豆。所以海岸里所有的手冲咖啡设备都是自己工厂的，客人使用的咖啡壶包括橱窗里销售的都是订制出的产品。而咖啡豆更是讲究，老板精选新鲜咖啡豆，在店里自己烘焙，那台好似火车头一样的烘豆机就是镇店至宝。",@"店长说海岸是由两个老板合伙经营的，一个开工厂专门制作咖啡相关器具，另一个主要做咖啡豆。所以海岸里所有的手冲咖啡设备都是自己工厂的，客人使用的咖啡壶包括橱窗里销售的都是订制出的产品。而咖啡豆更是讲究，老板精选新鲜咖啡豆，在店里自己烘焙，那台好似火车头一样的烘豆机就是镇店至宝。",@"店长说海岸是由两个老板合伙经营的，一个开工厂专门制作咖啡相关器具，另一个主要做咖啡豆。所以海岸里所有的手冲咖啡设备都是自己工厂的，客人使用的咖啡壶包括橱窗里销售的都是订制出的产品。而咖啡豆更是讲究，老板精选新鲜咖啡豆，在店里自己烘焙，那台好似火车头一样的烘豆机就是镇店至宝。",@"店长说海岸是由两个老板合伙经营的，一个开工厂专门制作咖啡相关器具，另一个主要做咖啡豆。所以海岸里所有的手冲咖啡设备都是自己工厂的，客人使用的咖啡壶包括橱窗里销售的都是订制出的产品。而咖啡豆更是讲究，老板精选新鲜咖啡豆，在店里自己烘焙，那台好似火车头一样的烘豆机就是镇店至宝。"];
    self.shopImgURLArray = @[@"0000.jpg",@"8888.jpg",@"4444.jpg",@"104.jpg"];
}


#pragma mark -
#pragma mark - Collection View Delegate -
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (self.paragraphArray.count > self.shopImgURLArray.count ? self.paragraphArray.count : self.shopImgURLArray.count) + 1;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return CGSizeMake(s_width, s_width/2+10);
    }
    else{
        return CGSizeMake(s_width, [self getParagraphHeightWithParagraph:self.paragraphArray[indexPath.row-1]]+s_width/kArticleDetailImgRatio + 20);
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ArticleDetailTopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArticleDetailTopCell" forIndexPath:indexPath];
        [cell setArticleImageURL:@"222.jpg" portrailImageURL:@"touxiang8" articleTitle:@"海岸咖啡&榴小莲" by_nickNameString:@"by 想咬我你必须有牙 美食编辑 15-01-01"];
        return cell;
    }
    else{
        ArticleDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArticleDetailCell" forIndexPath:indexPath];
        [cell setArticleText:self.paragraphArray[indexPath.row-1] paragraphHeight:[self getParagraphHeightWithParagraph:self.paragraphArray[indexPath.row-1]] articleImageURL:self.shopImgURLArray[indexPath.row-1]];
        return cell;
    }
}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}

#pragma mark - 文段高度 -
-(CGFloat)getParagraphHeightWithParagraph:(NSString  *)paragraph
{
    SpacingLabel *spacingLabel = [[SpacingLabel alloc] init];
    spacingLabel.text = paragraph;
    spacingLabel.font = [UIFont systemFontOfSize:17.0];
    spacingLabel.linesSpacing = 6.0;
    
    return [spacingLabel getAttributedStringHeightWidthValue:s_width-20]*1.085;
    
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
