//
//  VPPMapCluster.h
//  mapyidong
//
//  Created by Hello Coffee on 14/12/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VPPMapCustomAnnotation.h"
@interface VPPMapCluster : NSObject<VPPMapCustomAnnotation>

@property(nonatomic,strong)NSMutableArray *annotations;

@property(nonatomic,readonly)CLLocationCoordinate2D coorfinate;

@end
