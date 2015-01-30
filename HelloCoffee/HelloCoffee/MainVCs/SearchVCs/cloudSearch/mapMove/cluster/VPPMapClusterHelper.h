//
//  VPPMapClusterHelper.h
//  mapyidong
//
//  Created by Hello Coffee on 14/12/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface VPPMapClusterHelper : NSObject

@property(nonatomic,strong)MKMapView *mapView;

- (VPPMapClusterHelper *) initWithMapView:(MKMapView*)mapView;

- (void) clustersForAnnotations:(NSArray*)annotations distance:(float)distance completion:(void (^)(NSArray *data))block;

@end
