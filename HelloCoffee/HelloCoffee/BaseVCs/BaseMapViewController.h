//
//  BaseMapViewController.h
//  maptest
//
//  Created by Hello Coffee on 14/12/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AMapCloudKit/AMapCloudAPI.h>
//#import "APIKey.h"
#import "BaseViewController.h"
@interface BaseMapViewController : BaseViewController<MKMapViewDelegate,AMapCloudDelegate>

@property (nonatomic, strong) MKMapView *mapView;

@property (nonatomic, strong) AMapCloudAPI *cloudAPI;

- (void)returnAction;

@end
