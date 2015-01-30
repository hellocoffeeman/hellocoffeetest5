//
//  PublishArticleViewController.m
//  HelloCoffee
//
//  Created by HelloCoffee on 15/1/21.
//  Copyright (c) 2015年 HelloCoffee. All rights reserved.
//

#import "PublishArticleViewController.h"
#import "PublishArticleCollectionViewCell.h"
@interface PublishArticleViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation PublishArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeNavWithTitleLabel:@"我的发布" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    _collView.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [self loadData];
}

-(void)loadData
{
  
}
-(void)viewDidAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=YES;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UINib *nib=[UINib nibWithNibName:@"PublishArticleCollectionViewCell" bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"public"];
    
    PublishArticleCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"public" forIndexPath:indexPath];
    
    return cell;
}
-(NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cellSize;
    cellSize.width=s_width;
    cellSize.height=140;
    return cellSize;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPth.row=%d",indexPath.row);
}
@end
