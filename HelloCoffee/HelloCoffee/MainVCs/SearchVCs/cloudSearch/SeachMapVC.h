//
//  MapExample.h
//  mapyidong
//
//  Created by Hello Coffee on 14/12/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "BaseViewController.h"
#import <MapKit/MapKit.h>
#import "VPPMapHelperDelegate.h"
#import "VPPMapHelper.h"
#import "CloudPOIAnnotation.h"
#import <AMapCloudKit/AMapCloudAPI.h>

@interface SeachMapVC : BaseViewController<VPPMapHelperDelegate,AMapCloudDelegate,CLLocationManagerDelegate>

@property(nonatomic,strong)VPPMapHelper *mh;
@property(nonatomic,strong)MKMapView *mapView;
@property (nonatomic, strong) AMapCloudAPI *cloudAPI;
@property(nonatomic,strong)CLLocationManager *locationManager;
@end
