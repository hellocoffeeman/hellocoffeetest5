//
//  BaseMapViewController.m
//  maptest
//
//  Created by Hello Coffee on 14/12/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "BaseMapViewController.h"

@interface BaseMapViewController ()

@end

@implementation BaseMapViewController
@synthesize mapView = _mapView;
@synthesize cloudAPI = _cloudAPI;


- (void)clearMapView
{
    self.mapView.showsUserLocation = YES;
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    [self.mapView removeOverlays:self.mapView.overlays];
    
    self.mapView.delegate = nil;
}

- (void)clearCloudSearch
{
    self.cloudAPI.delegate = nil;
}

- (void)checkTableID
{
    if ([yunTableID length] == 0)
    {
//        NSLog(@"%@",[NSString stringWithFormat:@"\nSDKVersion:%@\nFILE:%s\nLINE:%d\nMETHOD:%s", [MAMapServices sharedServices].SDKVersion, __FILE__, __LINE__, __func__]);
        NSLog(@"请首先配置APIKey.h中的tableID, 查询tableID参考见 http://yuntu.amap.com");
    }
}

#pragma mark - Handle Action

- (void)returnAction
{
    [self.navigationController popViewControllerAnimated:YES];
    
    [self clearMapView];
    
    [self clearCloudSearch];
}

#pragma mark - AMapSearchDelegate

- (void)cloudRequest:(id)cloudSearchRequest error:(NSError *)error
{
    NSLog(@"CloudRequestError:{Code: %ld; Description: %@}", (long)error.code, error.localizedDescription);
}

#pragma mark - Initialization

- (void)initMapView
{
    if (self.mapView == nil)
    {
        self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    }
    
    self.mapView.frame = self.view.bounds;
    
    self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
    
    self.mapView.visibleMapRect = MKMapRectMake(220880104, 101476980, 272496, 466656);
}

- (void)initCloudSearch
{
    self.cloudAPI.delegate = self;
}

- (void)initBaseNavigationBar
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:self
                                                                            action:@selector(returnAction)];
}

- (void)initTitle:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] init];
    
    titleLabel.backgroundColor  = [UIColor clearColor];
    titleLabel.textColor        = [UIColor whiteColor];
    titleLabel.text             = title;
    [titleLabel sizeToFit];
    
    self.navigationItem.titleView = titleLabel;
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initTitle:self.title];
    
    [self initBaseNavigationBar];
    
    [self initMapView];
    
    [self initCloudSearch];
    
    [self checkTableID];
}

@end
