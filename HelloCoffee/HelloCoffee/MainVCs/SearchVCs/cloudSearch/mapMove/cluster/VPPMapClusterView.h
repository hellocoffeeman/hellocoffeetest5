//
//  VPPMapClusterView.h
//  mapyidong
//
//  Created by Hello Coffee on 14/12/25.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>

@interface VPPMapClusterView : MKAnnotationView{
@private UILabel *_label;
}
@property(nonatomic,strong)NSString *title;
-(id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier;
@end
