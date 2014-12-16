//
//  OrderCoffeeViewController.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/11/21.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "OrderCoffeeViewController.h"
#import "CoffeeInfoCollectionViewCell.h"
#import "CheckOrderViewController.h"

@interface OrderCoffeeViewController ()

// 控件
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;

// 数据
@property (nonatomic, strong) NSArray *coffeePicturesArray; // coffee 图片
@property (nonatomic, strong) NSArray *coffeeNameArray; // coffee 种类/_id
@property (nonatomic, strong) NSArray *coffeeInfoArray; // coffer 介绍
@property (nonatomic, strong) NSArray *coffeePriceArray; // coffee 价格
@property (nonatomic, strong) NSMutableArray *orderCountArray; // 记录每种coffee的杯数

@end

@implementation OrderCoffeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"点咖啡";
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    // 设置 返回键 Title
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem = backItem;
    backItem.title = @" ";
    
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"CoffeeInfoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CoffeeInfoCollectionViewCell"]; // 注册
    
    // 数据
    self.coffeeNameArray = @[@"经典咖啡",@"拿铁",@"美式咖啡",@"摩卡咖啡",@"意式浓缩咖啡",@"卡布奇诺",@"榛子咖啡",@"爱尔兰"];
    self.coffeeInfoArray = @[@"其咖啡杯是一种方便于烤杯的耐热杯。烤杯的方法可以去除烈酒中的酒精，让酒香与咖啡更能够直接的调和。",@"爱尔兰咖啡（Irish Coffee）是一种既像酒又像咖啡的咖啡，原料是威士忌加咖啡豆，特殊的咖啡杯，特殊的煮法，认真而执着，古老而简朴。",@"特殊的咖啡杯，特殊的煮法，认真而执着，古老而简朴。 ",@"一种既像酒又像咖啡的咖啡，原料是威士忌加咖啡豆，特殊的咖啡杯，特殊的煮法，认真而执着，古老而简朴。其咖啡杯是一种方便于烤杯的耐热杯。烤杯的方法可以去除烈酒中的酒精，让酒香与咖啡更能够直接的调和。一种既像酒又像咖啡的咖啡，原料是威士忌加咖啡豆，特殊的咖啡杯，特殊的煮法，认真而执着，古老而简朴。一种既像酒又像咖啡的咖啡，原料是威士忌加咖啡豆，特殊的咖啡杯，特殊的煮法，认真而执着，古老而简朴。",@"一种既像酒又像咖啡的咖啡，原料是威士忌加咖啡豆，特殊的咖啡杯，特殊的煮法，认真而执着，古老而简朴。其咖啡杯是一种方便于烤杯的耐热杯。",@"烤杯的方法可以去除烈酒中的酒精，让酒香与咖啡更能够直接的调和。",@"一种既像酒又像咖啡的咖啡，原料是威士忌加咖啡豆，特殊的咖啡杯，特殊的煮法，认真而执着，古老而简朴。其咖啡杯是一种方便于烤杯的耐热杯。烤杯的方法可以去除烈酒中的酒精，让酒香与咖啡更能够直接的调和。",@"爱尔兰咖啡（Irish Coffee）"];
    self.coffeePriceArray = @[@"28",@"38",@"48",@"58",@"68",@"78",@"88",@"98"];

    
//    self.coffeePicturesArray = @[[UIImage imageNamed:@"Coffee"],[UIImage imageNamed:@"CoffeeLatte"],[UIImage imageNamed:@"AmericanCoffee"],[UIImage imageNamed:@"MochaCoffee"],[UIImage imageNamed:@"Espresso"],[UIImage imageNamed:@"Cappuccino"],[UIImage imageNamed:@"HazelnutCoffee"],[UIImage imageNamed:@"IrishCoffee"]];
    
//     self.coffeePicturesArray = @[@"100.jpg",@"101.jpg",@"102.jpg",@"103.jpg",@"104.jpg",@"105.jpg",@"106.jpg",@"107.jpg",@"108.jpg",@"109.jpg"];
    
//self.coffeePicturesArray = @[@"Coffee",@"CoffeeLatte",@"AmericanCoffee",@"MochaCoffee",@"Espresso",@"Cappuccino",@"HazelnutCoffee",@"IrishCoffee"];

    self.coffeePicturesArray = @[[UIImage imageNamed:@"Coffee.jpg"],[UIImage imageNamed:@"CoffeeLatte.jpg"],[UIImage imageNamed:@"AmericanCoffee.jpg"],[UIImage imageNamed:@"MochaCoffee.jpg"],[UIImage imageNamed:@"Espresso.jpg"],[UIImage imageNamed:@"Cappuccino.jpg"],[UIImage
                                                                                                                                                                                                                                                    imageNamed:@"HazelnutCoffee.jpg"],[UIImage imageNamed:@"IrishCoffee.jpg"]];

//    self.orderCountArray = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    self.orderCountArray = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1", nil];

    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Coffee 杯数 -
-(void)orderCoffeeAddCount:(UIButton *)button{
    
    // Button所在的Cell
    CoffeeInfoCollectionViewCell *cell = (CoffeeInfoCollectionViewCell *)[[button superview] superview];
    
    // 杯数 +1
    int orderCount = [cell.orderCountLabel.text intValue]; // 当前杯数
    if (orderCount <= 9) {
        orderCount ++;
        cell.orderCountLabel.text = [NSString stringWithFormat:@"%d",orderCount];
        [self.orderCountArray removeObjectAtIndex:cell.indexPath.row];
        [self.orderCountArray insertObject:cell.orderCountLabel.text atIndex:cell.indexPath.row];    }
    
}
-(void)orderCoffeeSubtractCount:(UIButton *)button{
    
    // Button所在的Cell
    CoffeeInfoCollectionViewCell *cell = (CoffeeInfoCollectionViewCell *)[[button superview] superview];
    
    // 杯数 -1
    int orderCount = [cell.orderCountLabel.text intValue]; // 当前杯数
    if (orderCount >= 1) {
        orderCount --;
        cell.orderCountLabel.text = [NSString stringWithFormat:@"%d",orderCount];
        [self.orderCountArray removeObjectAtIndex:cell.indexPath.row];
        [self.orderCountArray insertObject:cell.orderCountLabel.text atIndex:cell.indexPath.row];
    }
    
}
#pragma mark - 下一步 -

- (IBAction)nextStep:(UIButton *)sender {
    
    NSLog(@"Next Step - Check Order");

    CheckOrderViewController *checkOrderVC = [[CheckOrderViewController alloc] init];
    
    // 传递数据
    checkOrderVC.personCount = self.personCount;
   
    checkOrderVC.coffeeNameArray = [NSMutableArray array];
    checkOrderVC.coffeePriceArray = [NSMutableArray array];
    checkOrderVC.orderCountArray = [NSMutableArray array];
    
    // 将客户选择的coffee储存
    for (int i = 0; i < self.coffeePriceArray.count; i++) {
        // 将Order数量不为0的coffee 传递
        if ([self.orderCountArray[i] intValue] != 0) {
            
            [checkOrderVC.coffeeNameArray addObject:self.coffeeNameArray[i]];
            [checkOrderVC.coffeePriceArray addObject:self.coffeePriceArray[i]];
            [checkOrderVC.orderCountArray addObject:self.orderCountArray[i]];

        }
        
    }
    
    // 判断
    if (checkOrderVC.coffeeNameArray.count == 0) {
        
        NSLog(@"您还没有选择需要的Coffee");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"亲爱的顾客：您还没有选择需要的咖啡呢 ~ \n  请继续选择吧 ！" delegate:nil cancelButtonTitle:@"继续选择" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    
    [self.navigationController pushViewController:checkOrderVC animated:YES];
    
}

#pragma mark - Collection View Delegate -
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.orderCountArray.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = self.coffeeInfoArray[indexPath.row];
    CGFloat height = [self getCoffeeInfoLabelHeightWithText:text];
    
    return CGSizeMake(s_width, height + s_width/1.875 + 35 + 30 + 10);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CoffeeInfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CoffeeInfoCollectionViewCell" forIndexPath:indexPath];
    
    // 填充内容
    cell.indexPath = indexPath;
//    cell.photoImageView.image =[UIImage imageNamed:@"testPIC.png"];
//    cell.photoImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.coffeePicturesArray[indexPath.row]]];
    cell.photoImageView.image = self.coffeePicturesArray[indexPath.row];

    [cell setInformationWithCoffeeName:self.coffeeNameArray[indexPath.row] coffeePrice:[NSString stringWithFormat:@"￥ %@",self.coffeePriceArray[indexPath.row]] orderCount:self.orderCountArray[indexPath.row] coffeeInfo:[self.coffeeInfoArray objectAtIndex:indexPath.row]]; // coffee 名字、价格、数量、介绍
    [cell addTarget:self withAddButtonAction:@selector(orderCoffeeAddCount:) subtractButtonAction:@selector(orderCoffeeSubtractCount:)]; // count action
    
    return cell;
    
}

#pragma mark - 计算高度 -
-(CGFloat)getCoffeeInfoLabelHeightWithText:(NSString *)text
{
    NSDictionary *attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:15]}; // 文字 字体
    CGRect rect = [text boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 30, 30000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributeDic context:nil];
    return rect.size.height + 15; // Label 比文字高出 20
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
