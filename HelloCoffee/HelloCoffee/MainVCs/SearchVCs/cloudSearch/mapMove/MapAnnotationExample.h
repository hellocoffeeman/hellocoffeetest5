//
//  MapAnnotationExample.h
//  mapyidong
//
//  Created by Hello Coffee on 14/12/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "VPPMapCustomAnnotation.h"

@interface MapAnnotationExample : NSObject<VPPMapCustomAnnotation>
{

}
//大头针的坐标 必须得属性
@property (nonatomic,assign)CLLocationCoordinate2D  coordinate;
//大头针的标题
@property(nonatomic,copy)NSString *title;
//大头针的副标题
@property(nonatomic,copy)NSString *subtitle;

@property(nonatomic,copy)NSString *distance;

@end
