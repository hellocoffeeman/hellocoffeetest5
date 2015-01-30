//
//  MapExample.m
//  mapyidong
//
//  Created by Hello Coffee on 14/12/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "SeachMapVC.h"
#import "VPPMapHelper.h"
#import "MapAnnotationExample.h"

//#import 

@interface SeachMapVC ()

@end

@implementation SeachMapVC
/*******************************************/
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status)
    {
        case kCLAuthorizationStatusNotDetermined:
            if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
            {
                [self.locationManager requestAlwaysAuthorization];
            }
            break;
        default:
            break;
    }
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{   //use locations
//    NSLog(@"%f  \n %f",manager.location.coordinate.latitude,manager.location.coordinate.longitude);
//    [self.locationManager stopUpdatingLocation];
//    [self cloudPlaceAroundSearchWith:manager.location.coordinate.latitude withLongitude:manager.location.coordinate.longitude];
//    [self.locationManager stopUpdatingLocation];
}
/*******************************************/
//
//-(float)RandomFloatStart:(float)a end:(float)b {
//    float random = ((float) rand()) / (float) RAND_MAX;
//    float diff = b - a;
//    float r = random * diff;
//    return a + r;
//}
////随机100个大头针
//- (void) tonsOfPins {
//    srand((unsigned)time(0));
//    
//    NSMutableArray *tempPlaces=[[NSMutableArray alloc] initWithCapacity:0];
////    ~~~~~~~~~~~~~~~~~~~~
//    for (int i = 0; i < 4; i++) {
//        
//        MapAnnotationExample *place= [[MapAnnotationExample alloc] init];
//        place.coordinate = CLLocationCoordinate2DMake([self RandomFloatStart:41.0 end:44.0],[self RandomFloatStart:-9.0 end:-5.0]);
//        [place setTitle:[NSString stringWithFormat:@"Place %d title",i]];
//       
//        [tempPlaces addObject:place];
//
//        
//    }
////~~~~~~~~~~~~~~~~~~~~    
////    self.mh.shouldClusterPins = YES;
////    [self.mh setMapAnnotations:tempPlaces];
//
//}
#pragma mark -

//AMapCloudPlaceAroundSearchRequest 对象，并配置相应的查询参数
-(void)cloudPlaceAroundSearchWith:(CGFloat)latitude withLongitude:(CGFloat)longitude
//- (void)cloudPlaceAroundSearch
{
    AMapCloudPlaceAroundSearchRequest *placeAround = [[AMapCloudPlaceAroundSearchRequest alloc] init];
    //设置tableID,tableID可从云图数据后台中获取
    [placeAround setTableID:yunTableID];
    
    double radius = 3000;
    AMapCloudPoint *centerPoint = [AMapCloudPoint locationWithLatitude:latitude longitude:longitude];
    
    //设置搜索的中心点和半径
    [placeAround setRadius:radius];
    [placeAround setCenter:centerPoint];
    
    //设置关键字
//    [placeAround setKeywords:@"公园"];
    
    //设置每页记录数和当前页数
    [placeAround setOffset:80];
//    [placeAround setPage:1];
    
    [self.cloudAPI AMapCloudPlaceAroundSearch:placeAround];
    
    
    [self.locationManager stopUpdatingLocation];
}
- (void)onCloudPlaceAroundSearchDone:(AMapCloudPlaceAroundSearchRequest *)request response:(AMapCloudSearchResponse *)response
{
    NSLog(@"status:%d ,info:%@ ,count:%d",response.status, response.info, response.count);
    //调用addAnnotationswithPOIs将返回结果标注在高德地图上
//    [self addAnnotationsWithPOIs:[response POIs]];
    
    
    NSMutableArray *tempPlaces=[[NSMutableArray alloc] initWithCapacity:0];
    NSArray *arr = [[NSArray alloc]initWithArray:[response POIs]];

    for (int i = 0; i < arr.count; i++) {
//
        MapAnnotationExample *place= [[MapAnnotationExample alloc] init];
        
        place.coordinate = CLLocationCoordinate2DMake([[(AMapCloudPOI *)arr[i] location] latitude], [[(AMapCloudPOI *)arr[i] location] longitude]);
        [place setTitle:[NSString stringWithFormat:@"%@",[(AMapCloudPOI *)arr[i] name]]];
        [place setSubtitle:[NSString stringWithFormat:@"%@",[(AMapCloudPOI *)arr[i] address]]];
        place.distance = [NSString stringWithFormat:@"%d",[(AMapCloudPOI *)arr[i] distance] ];
        [tempPlaces addObject:place];
       
    }
     self.mh.shouldClusterPins = YES;
     [self.mh setMapAnnotations:tempPlaces];
}
#pragma mark -
#pragma mark viewDidLoad
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeNavWithTitleLabel:@"搜索周边" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil
                 rightBtnAction:nil];
//
    //创建对象
    self.locationManager=[[CLLocationManager alloc]init];
    //设置代理
    self.locationManager.delegate=self;
    //开始定位
    [self.locationManager  startUpdatingLocation];
//    self.mapView.showsUserLocation = YES;

//
    self.cloudAPI = [[AMapCloudAPI alloc]initWithCloudKey:yunAPIKey delegate:self];
//    
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.mapView];
   
        self.mh =  [VPPMapHelper
        VPPMapHelperForMapView:self.mapView
                    pinAnnotationColor:MKPinAnnotationColorGreen centerOnUserLocation:NO showDisclosureButton:YES
                    delegate:self] ;
//    self.mh.xiaoxiaodelegate = self;
    self.mapView.showsUserLocation = YES;
//   self.mh.userCanDropPin = YES;

    self.mh.allowMultipleUserPins = YES;
    self.mh.pinDroppedByUserClass = [MapAnnotationExample class];
[self cloudPlaceAroundSearchWith:self.locationManager.location.coordinate.latitude withLongitude:self.locationManager.location.coordinate.longitude];
    
    MKCoordinateRegion center ;
    
    center.center.latitude = self.locationManager.location.coordinate.latitude;
    center.center.longitude = self.locationManager.location.coordinate.longitude;
    center.span.latitudeDelta = 0.4;
    center.span.longitudeDelta = 0.4;
    
    [self locateToCenter:center];
 }

#pragma mark -

#pragma mark VPPMapHelperDelegate
//以下可以删除
//大头针的详细信息
- (void) open:(id<MKAnnotation>)annotation {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Annotation pressed" message:[NSString stringWithFormat:@"It says: %@",annotation.title] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av show];

}

#pragma mark -
-(void)locateToCenter:(MKCoordinateRegion)center1
{
    //    设置地图中心的，纬度  经度
    CLLocationCoordinate2D center = center1.center;
    //    设置地图显示的范围
    MKCoordinateSpan span = center1.span;
    //    地图范围显示的越小 细节越清楚
    span.latitudeDelta = span.latitudeDelta*0.7;
    span.longitudeDelta = span.longitudeDelta*0.7;
    //    创建MKCoordinateRegion对象,该对象代表地图显示中心和显示范围
    MKCoordinateRegion region = {center,span};
    //    设置当前地图的显示中心和显示范围
    [self.mapView setRegion:region animated:YES];
    //    NSLog(@"用户当前是否位于地图中：%d" , self.mapView.userLocationVisible);
}
@end
