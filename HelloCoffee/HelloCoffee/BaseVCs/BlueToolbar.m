//
//  BlueToolbar.m
//  HelloCoffee
//
//  Created by hellocoffee2 on 14/12/8.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "BlueToolbar.h"
static BlueToolbar *_blueToolBar = nil;
@implementation BlueToolbar




+ (instancetype)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (_blueToolBar == nil) {
            _blueToolBar = [super allocWithZone:zone];
            return _blueToolBar;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}


+(UIToolbar*)shareToolBarWithSuperView:(UIView*)view withTitle:(NSString*)title withTarget:(id)target withBackAction:(SEL)backAction
{@synchronized(self) {
    if (_blueToolBar == nil) {
//        _blueToolBar = [[BlueToolbar alloc] init];
        _blueToolBar = [[BlueToolbar alloc]initWithFrame:CGRectMake(0, 20, s_width, 44)];
        [_blueToolBar setBackgroundImage:[UIImage imageNamed:@"dilan.png"] forToolbarPosition:0 barMetrics:UIBarMetricsDefault];
        
//        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, s_width-90, 44)];
//        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
//        
//        _titleLabel.backgroundColor = [UIColor clearColor];
//        _titleLabel.textColor = [UIColor whiteColor];
//        _titleLabel.shadowColor = [UIColor blackColor];
//        _titleLabel.shadowOffset = CGSizeMake(0, 1);
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        UIBarButtonItem *titleItem = [[UIBarButtonItem alloc]initWithCustomView:titleLabel];
        
    }
}
   
    
    //    _toolBar.backgroundColor = [UIColor blueColor];
    
    
//    titleLabel.text = title;
//    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"geren"] style:UIBarButtonItemStylePlain target:self action:@selector(returnBack)];
    
    
    
//    toolBar.items = [NSArray arrayWithObjects:backBtn,titleItem, nil];
//    self.navigationController.navigationBarHidden = YES;
//    [self.view addSubview:toolBar];
//    return toolBar;
     return _blueToolBar;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
