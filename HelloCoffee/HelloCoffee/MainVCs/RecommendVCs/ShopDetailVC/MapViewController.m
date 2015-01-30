//
//  MapViewController.m
//  HelloCoffee
//
//  Created by Hello Coffee on 14/11/20.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *myAddressLabel;
@property(strong , nonatomic) CLGeocoder *geocoder;
- (IBAction)pilot:(id)sender;
//定义一个变量来保存路线图
@property(strong,nonatomic)MKPolyline *naviPath;
@property(strong,nonatomic)CLLocationManager *locationManager;
@end

@implementation MapViewController
-(void)dealloc
{
    self.mapView.delegate = nil;
    [self.locationManager stopUpdatingLocation];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick beginLogPageView:@"地图页面"];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"地图页面"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeNavWithTitleLabel:@"地图" withRightBtn:NO rightButtonTitle:nil rightBtnImageURL:nil target:nil rightBtnAction:nil];
    
    //创建对象
    self.locationManager=[[CLLocationManager alloc]init];
    //设置代理
    self.locationManager.delegate=self;
    //开始定位
    [self.locationManager startUpdatingLocation];
    
    //kCLLocationAccuracyNearestTenMeters:10.0f;
    
    //    移动10米时 更新数据
    
    self.locationManager.distanceFilter = 10.0f;

    self.geocoder = [[CLGeocoder alloc]init];
    
    //    设置地图的显示风格，此处设置使用标准地图
    self.mapView.mapType = MKMapTypeStandard;
    //    设置地图可缩放
    self.mapView.zoomEnabled = YES;
    //    设置地图可滚动
    self.mapView.scrollEnabled = YES;
    //    设置地图可旋转
    self.mapView.rotateEnabled = YES;
    //    设置显示用户当前位置
    self.mapView.showsUserLocation = YES;
    //    为mapView设置delegate
    self.mapView.delegate = self;
    //    调用自己实现的方法设置地图的显示位置和显示区域
    [self jiexi];
    
    
}
//  用户地理位置发生改变时触发
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // 获取经纬度
    NSLog(@"纬度:%f",newLocation.coordinate.latitude);
    NSLog(@"经度:%f",newLocation.coordinate.longitude);
    // 停止位置更新
    [manager stopUpdatingLocation];
}
-(void)locateToLatitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
    //    设置地图中心的，纬度  经度
    CLLocationCoordinate2D center = {latitude,longitude};
    //    设置地图显示的范围
    MKCoordinateSpan span;
    //    地图范围显示的越小 细节越清楚
    span.latitudeDelta = 0.2;
    span.longitudeDelta = 0.2;
    //    创建MKCoordinateRegion对象,该对象代表地图显示中心和显示范围
    MKCoordinateRegion region = {center,span};
    //    设置当前地图的显示中心和显示范围
    [self.mapView setRegion:region animated:YES];
    NSLog(@"用户当前是否位于地图中：%d" , self.mapView.userLocationVisible);
    
    
    //
    //    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
    ////    annotation.title = self.text3.text;
    //    annotation.subtitle = @"...";
    //    CLLocationCoordinate2D coordinate = {latitude,longitude};
    //    annotation.coordinate = coordinate;
    //    //    添加锚点
    //    [self.mapView addAnnotation:annotation];
    
}
//根据地址解析经纬度  添加锚点 店铺地址
-(void)jiexi
{
    
    if(self.addr != nil && self.addr.length > 0)
    {
        [self.geocoder geocodeAddressString:self.addr
                          completionHandler: ^(NSArray *placemarks, NSError *error)
         {
             // 如果解析结果的集合元素的个数大于1，表明解析得到了经度、纬度信息
             if (placemarks.count > 0)
             {
                 // 只处理第一个解析结果，实际项目中可使用列表让用户选择
                 CLPlacemark* placemark = placemarks[0];
                 CLLocation* location = placemark.location;
                 //
                 MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
                 //    annotation.title = self.text3.text;
                 annotation.subtitle = @"...";
                 CLLocationCoordinate2D coordinate = {location.coordinate.latitude,location.coordinate.longitude};
                 annotation.coordinate = coordinate;
                 //    添加锚点
                 [self.mapView addAnnotation:annotation];
                 
             }
             // 没有得到解析结果。
             else
             {
                 // 使用UIAlertView提醒用户
                 [[[UIAlertView alloc] initWithTitle:@"提醒"
                                             message:@"地址无法解析" delegate:nil
                                   cancelButtonTitle:@"确定" otherButtonTitles: nil]
                  show];
             }
         }];
    }
}

//根据经纬度反向解析地址
-(void)ReverseAnalysis:(CGFloat)latitude andLongitude:(CGFloat)longitude {
    //    不能太精确
    NSString* longitudeStr = [NSString stringWithFormat:@"%f",longitude];
    NSString* latitudeStr = [NSString stringWithFormat:@"%f",latitude];
    NSLog(@"%@",longitudeStr);
    if(longitudeStr != nil && longitudeStr.length > 0
       && latitudeStr != nil && latitudeStr.length > 0)
    {
        // 将用户输入的经度、纬度封装成CLLocation对象
        CLLocation* location = [[CLLocation alloc]
                                initWithLatitude:[latitudeStr floatValue]
                                longitude:[longitudeStr floatValue]];
        [self.geocoder reverseGeocodeLocation:location completionHandler:
         ^(NSArray *placemarks, NSError *error)
         {
             // 如果解析结果的集合元素的个数大于1，表明解析得到了经度、纬度信息
             if (placemarks.count > 0)
             {
                 // 只处理第一个解析结果，实际项目可使用列表让用户选择
                 CLPlacemark* placemark = placemarks[0];
                 // 获取详细地址信息
                 NSArray* addrArray = [placemark.addressDictionary
                                       objectForKey:@"FormattedAddressLines"];
                 // 将详细地址拼接成一个字符串
                 NSMutableString* addr = [[NSMutableString alloc] init];
                 for(int i = 0 ; i < addrArray.count ; i ++)
                 {
                     [addr appendString:addrArray[i]];
                 }
                 NSLog(@"!!!!~~~~~~~~~~%@",addr);
                 self.myAddressLabel.text = addr;
                 //                 self.label2.text = [NSString stringWithFormat:
                 //                                     @"经度：%g，纬度：%g的地址为：%@" ,
                 //                                     location.coordinate.longitude ,
                 //                                     location.coordinate.latitude , addr];
             }
             // 没有得到解析结果。
             else
             {
                 // 使用UIAlertView提醒用户
                 [[[UIAlertView alloc] initWithTitle:@"提醒"
                                             message:@"您输入的地址无法解析" delegate:nil
                                   cancelButtonTitle:@"确定" otherButtonTitles: nil]
                  show];
             }
         }];
    }
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        
        MKAnnotationView *annoView = [[MKAnnotationView alloc]init];
        
        //        NSArray *arr = @[@"geren@2x.png",@"kafeiguan2@2x.png",@"kafeiguan@2x.png"];
        annoView.image = [UIImage imageNamed:@"geren@2x.png"];
        annoView.canShowCallout = YES;
        return annoView;
        //        return nil;
    }
    //    复用
    static NSString * annoID = @"fk";
    MKAnnotationView *annoView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:annoID];
    if (!annoView) {
        annoView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annoID];
    }
    //    为锚点设图片
    annoView.image = [UIImage imageNamed:@"kafeiguan2@2x.png"];
    //    是否显示气泡信息
    annoView.canShowCallout = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
//    [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    annoView.rightCalloutAccessoryView = btn;
    return annoView;
}


//导航按钮
- (IBAction)pilot:(id)sender {
    NSString* destStr = self.addr;
    if (destStr != nil && destStr.length > 0)
    {
        // 解析目标地址，获取实际的经度、维度信息
        [self.geocoder geocodeAddressString:destStr completionHandler:
         ^void (NSArray *placemarks, NSError *error)
         {
             /* 实际应用中，此处如果发现placemarks集合包含多个元素，即表明根据该地址字符串
              检索到多个地址值，那么应该显示一个列表框让用户选择目标地址。
              此处为了简化该示例，直接使用第一个地址值作为目标地址。
              */
             if(placemarks.count > 0)
             {
                 // 删除上一次的导航路径
                 [self.mapView removeOverlay:self.naviPath];
                 // 创建MKDirectionsRequest对象，作为查询导航线路的请求
                 MKDirectionsRequest* request = [[MKDirectionsRequest alloc] init];
                 // 将当前位置设置为导航的起始点
                 request.source = [MKMapItem mapItemForCurrentLocation];
                 // 获取地址解析得到的第一个地址值
                 CLPlacemark* clPlacemark = placemarks[0];
                 MKPlacemark* mkPlacemark = [[MKPlacemark alloc]
                                             initWithPlacemark:clPlacemark];
                 // 将解析得到的目标地址设置为导航的结束点
                 request.destination = [[MKMapItem alloc]
                                        initWithPlacemark:mkPlacemark];
                 // 以MKDirectionsRequest作为参数，创建MKDirections对象
                 MKDirections* directions = [[MKDirections alloc]
                                             initWithRequest:request];
                 [directions calculateDirectionsWithCompletionHandler:
                  ^void (MKDirectionsResponse *response, NSError *error)
                  {
                      // 获取查询返回的第一条线路
                      MKRoute* route = response.routes[0];
                      // 保存检索得到的导航信息
                      self.naviPath = route.polyline;
                      // 将self.naviPath（MKPolyline对象）添加成覆盖层
                      [self.mapView addOverlay:self.naviPath
                                         level:MKOverlayLevelAboveLabels];
                  }];
             }
             else
             {
                 // 使用提示框提醒用户输入的地址无效
                 [[[UIAlertView alloc] initWithTitle:@"提醒"
                                             message:@"无法定位您输入的地址，请重新输入！" delegate:nil
                                   cancelButtonTitle:@"确定" otherButtonTitles: nil]
                  show];
             }
         }];
    }
}


#pragma mark mapDelegate
-(MKOverlayRenderer*)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    //    创建MKPolylineRenderer对象 ， 该对象负责绘制MKPolyline 覆盖层控件
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc]initWithPolyline:overlay];
    //    设置MKPolylineRenderer对象线的颜色
    renderer.strokeColor = [UIColor redColor];
    //    设置MKPolylineRenderer 的线宽
    renderer.lineWidth = 2;
    return renderer;
}
#pragma mark 定位代理方法
//此方法会在用户授权状态改变时调用，ios8后有
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
    //    NSLog(@"用户的位置%@",locations);
    NSLog(@"%@",    self.locationManager.location);
    //    <+40.03532904,+116.32633231> +/- 65.00m (speed -1.00 mps / course -1.00) @ 14/11/21 \U4e2d\U56fd\U6807\U51c6\U65f6\U95f411:45:47"
    
    
    
    
    //    CLLocation *loca = [[CLLocation alloc]init];
    //    NSLog(@"111111:--%f\n22222:--%f",self.locationManager.location.coordinate.latitude,self.locationManager.location.coordinate.longitude);
    
    
    //    NSString *str = (NSString*)self.locationManager.location;
    //    NSLog(@"%@",str);
    //    NSString *latitude = [str substringWithRange:NSMakeRange(2, 12)];
    //    NSLog(@"%@",latitude);
    
    //    self.locationManager.location.coordinate.latitude
    
    
    [self locateToLatitude:self.locationManager.location.coordinate.latitude longitude:self.locationManager.location.coordinate.longitude];
    [self ReverseAnalysis:self.locationManager.location.coordinate.latitude andLongitude:self.locationManager.location.coordinate.longitude];
}
//定位失败信息
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位失败%@",error);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




@end
