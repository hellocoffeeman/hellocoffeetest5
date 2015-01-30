//
//  VPPMapHelper.h
//  mapyidong
//
//  Created by Hello Coffee on 14/12/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "VPPMapHelperDelegate.h"
#define kVPPMapHelperLongitudeDelta 0.05f
#define kVPPMapHelperLatitudeDelta 0.05f
#define kVPPMapHelperDistanceBetweenPoints 40

@protocol xiaoxiaodelegate <NSObject>

-(void)tap:(UITapGestureRecognizer*)tap;



@end

@interface VPPMapHelper : NSObject<MKMapViewDelegate>
{
  
}
@property(nonatomic,assign) float currentZoom;
@property(nonatomic,strong) NSMutableArray *userPins;//用户的大头针
@property(nonatomic,strong) NSMutableArray *unfilteredPins;//没有过滤的大头针
@property(nonatomic,strong) NSMutableArray *pinsToRemove;//移除的大头针
//返回一个指定的实例 并且配置好
+(VPPMapHelper*)VPPMapHelperForMapView:(MKMapView*)mapView pinAnnotationColor:(MKPinAnnotationColor)annotationColor centerOnUserLocation:(BOOL)centerOnUserLocation showDisclosureButton:(BOOL)showDisclosureButton
                              delegate:(id<VPPMapHelperDelegate>)delegate;
//地图视图
@property(nonatomic,strong)MKMapView *mapView;
//代理
@property(nonatomic,strong)id<VPPMapHelperDelegate>delegate;
@property(nonatomic,strong)id<xiaoxiaodelegate>xiaoxiaodelegate;
/*************************************************************/

//设置用户能不能通过长按来放置一个大头针
@property(nonatomic,assign)BOOL userCanDropPin;
/** 设置用户长按放置多个大头针
 needs userCanDropPin to be set to YES. */
@property (nonatomic, assign) BOOL allowMultipleUserPins;
/** Holds reference to the pin's class that will be used when user longpresses.
 It must implement MKAnnotation protocol */
@property (nonatomic, assign) Class pinDroppedByUserClass;
//表示如果引脚应该集中 只适用于那些大头针属性设置为是的
@property (nonatomic, assign) BOOL shouldClusterPins;

//指示大头针之间的距离
@property (nonatomic, assign) float distanceBetweenPins;


//如果大头针的View 可以显示一个显露的按钮
//这个属性可以重写每一个标注了VPPCustomAnnotation。
@property (nonatomic, assign) BOOL showsDisclosureButton;

/** 指针的颜色 默认是红色 */
@property (nonatomic, assign) MKPinAnnotationColor pinAnnotationColor;
/*
 用给定的替换以前所有的注释 ，必须符合MKAnnotation协议，或者是VPPMapCustomAnnotation
 调用这个方法会自动居中显示地图。如果想避免这个功能，就删除然后使用
  addMapAnnotations：代替。
 如果shouldClusterPins设置为YES，给定的大头针会自动集群
 
 */
- (void)setMapAnnotations:(NSArray*)mapAnnotations;
/*
 为已经存在的增加了更多的地图标注，必须顺从MKAnnotation协议，或任选以VPPMapCustomAnnotation。
 如果shouldClusterPins设置为YES，给定的大头针会自动集群
 
 */
- (void)addMapAnnotations:(NSArray*)mapAnnotations;


/*
 指示用户的位置
 */
@property (nonatomic, assign) BOOL centersOnUserLocation;
/** Indicates the amount of zoom used when centering the map.
 */
@property (nonatomic, assign) MKCoordinateSpan mapRegionSpan;

/**如果centersOnUserLocation设置为YES，MapView类将它居中
 与mapRegionSpan表示。
 
 如果centersOnUserLocation设置为NO，MapView类将围绕为中心
 目前的注解，有需要的范围，让要显示所有注释。
*/
- (void) centerMap;

//设置的最佳地图区域，以显示指示坐标
- (void) centerOnCoordinate:(CLLocationCoordinate2D)coordinate;






@end
