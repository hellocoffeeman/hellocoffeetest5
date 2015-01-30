//
//  VPPMapCluster.m
//  mapyidong
//
//  Created by Hello Coffee on 14/12/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "VPPMapCluster.h"
#define kAnnotationsNumber @"%ld annotations"


@implementation VPPMapCluster

@synthesize pinAnnotationColor;
@synthesize opensWhenShown;
@synthesize annotations;

- (VPPMapCluster *) init {
    if (self = [super init]) {
        self.annotations = [NSMutableArray array];
    }
    
    return self;
}

- (NSString *) title {
    return [NSString stringWithFormat:kAnnotationsNumber,[self.annotations count]];
}
- (CLLocationCoordinate2D) coordinate {
    float lat = 0;
    float lon = 0;
    
    for (id<MKAnnotation> ann in self.annotations) {
        lat += ann.coordinate.latitude;
        lon += ann.coordinate.longitude;
    }
//    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//    NSLog(@"lat ----- = %f",lat);
//    NSLog(@"lon ----- = %f",lon);
//    NSLog(@"lat / %d ----- = %f",[self.annotations count],lat/[self.annotations count]);
//    NSLog(@"lon / %d----- = %f",[self.annotations count],lon/[self.annotations count]);
    return CLLocationCoordinate2DMake(lat/[self.annotations count], lon/[self.annotations count]);
}

@end
