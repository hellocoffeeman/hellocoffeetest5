//
//  VPPMapClusterView.m
//  mapyidong
//
//  Created by Hello Coffee on 14/12/25.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "VPPMapClusterView.h"
#import "VPPMapCluster.h"
#import <QuartzCore/QuartzCore.h>

@implementation VPPMapClusterView
- (id) initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, 30, 30)];
        

        
        
        
       self.image = [UIImage imageNamed:@"kafeiguan"];

        self.frame = CGRectMake(0,0, -40, -55);
        self.centerOffset = CGPointMake(20, -45);
        [self addSubview:_label];


        if ([annotation isKindOfClass:[VPPMapCluster class]]) {
            self.title = [NSString stringWithFormat:@"%ld",(unsigned long)[[(VPPMapCluster*)annotation annotations] count]];

            
        }
        
        
        
        _label.textColor = [UIColor whiteColor];
        _label.backgroundColor = [UIColor clearColor];
        _label.font = [UIFont boldSystemFontOfSize:17];
        _label.textAlignment = UITextAlignmentCenter;
        _label.shadowColor = [UIColor blackColor];
        _label.shadowOffset = CGSizeMake(0,-1);
        

//        _label.layer.cornerRadius = 10;
//        _label.layer.borderWidth = 2;
//        _label.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    }
    
    return self;
}
-(void)btnDown:(UIButton*)btn
{
    NSLog(@"btnDown");
}



//可以不要吧。。。。bukeyi
- (void) setTitle:(NSString *)title {
    _label.text = title;
}

- (NSString *) title {
    return _label.text;
}

@end
