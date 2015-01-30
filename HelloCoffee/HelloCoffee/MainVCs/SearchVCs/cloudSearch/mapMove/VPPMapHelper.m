//
//  VPPMapHelper.m
//  mapyidong
//
//  Created by Hello Coffee on 14/12/24.
//  Copyright (c) 2014年 HelloCoffee. All rights reserved.
//

#import "VPPMapHelper.h"
#import "VPPMapCustomAnnotation.h"
#import "VPPMapCluster.h"
#import "VPPMapClusterHelper.h"
#import "VPPMapClusterView.h"

#define kVPPMapHelperOpenAnnotationDelay 0.65

#define kVPPMapHelperOnePinLongitudeDelta 0.1f
#define kVPPMapHelperOnePinLatitudeDelta 0.1f

#define kPressDuration 0.5 // in seconds

@implementation VPPMapHelper
//可以去了
@synthesize mapView;
@synthesize delegate;
@synthesize centersOnUserLocation;
@synthesize showsDisclosureButton;
@synthesize pinAnnotationColor;
@synthesize mapRegionSpan;
@synthesize userCanDropPin;
@synthesize allowMultipleUserPins;
@synthesize pinDroppedByUserClass;
@synthesize shouldClusterPins;
@synthesize distanceBetweenPins;

+(VPPMapHelper *)VPPMapHelperForMapView:(MKMapView *)mapView pinAnnotationColor:(MKPinAnnotationColor)annotationColor centerOnUserLocation:(BOOL)centerOnUserLocation showDisclosureButton:(BOOL)showDisclosureButton delegate:(id<VPPMapHelperDelegate>)delegate
{
    VPPMapHelper *mh = [[VPPMapHelper alloc]init];
    mh.userPins = [[NSMutableArray alloc]init];
//    用户的位置
    mh.centersOnUserLocation = centerOnUserLocation;
//    外露的按钮
    mh.showsDisclosureButton = showDisclosureButton;
//    大头针的颜色
    mh.pinAnnotationColor = annotationColor;
//    地图的引用
    mh.mapView = mapView;
//    vppmapviewdelegate
    mh.delegate = delegate;
//    MKMapViewDelegate
    mapView.delegate = mh;
    mh.unfilteredPins = [[NSMutableArray alloc]init];
    mh.currentZoom = -1;
    mh.userCanDropPin = NO;
    
    // adds longpress gesture recognizer
    
//    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
//                                          initWithTarget:mh action:@selector(handleLongPress:)];
//    lpgr.minimumPressDuration = kPressDuration;
//    [mh.mapView addGestureRecognizer:lpgr];
    
    // listens to userLocation's changes
    [mh.mapView.userLocation addObserver:mh
                              forKeyPath:@"location"
                                 options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)
                                 context:NULL];
    return mh;
}
- (float) distanceBetweenPins {
    if (distanceBetweenPins == 0) {
        return kVPPMapHelperDistanceBetweenPoints;
    }
    else {
        return distanceBetweenPins;
    }
}

- (CGFloat)annotationPadding {
    return 10.0f;
}

- (CGFloat)calloutHeight {
    return 40.0f;
}
#pragma mark longpress
- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan
        || self.userCanDropPin == NO) {
        return;
    }
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    if (!self.allowMultipleUserPins) {
        for (id<MKAnnotation> ann in _userPins) {
            [self.mapView removeAnnotation:ann];
        }
    }
    
    id<MKAnnotation> pinDroppedByUser = [[self.pinDroppedByUserClass alloc] init];
    pinDroppedByUser.coordinate = touchMapCoordinate;
    
    BOOL open = [self.delegate annotationDroppedByUserShouldOpen:pinDroppedByUser];
    
    [self.mapView addAnnotation:pinDroppedByUser];
    
    if (open) {
        [self performSelector:@selector(openAnnotation:) withObject:pinDroppedByUser afterDelay:kVPPMapHelperOpenAnnotationDelay];
    }
    [_userPins addObject:pinDroppedByUser];
//    [pinDroppedByUser release];
}

//OPEN查看详情的代理
-(void)open:(id)sender {
    // gets the only (that's why objectAtIndex:0) annotation selected
    id<MKAnnotation> ann = [self.mapView.selectedAnnotations objectAtIndex:0];
//    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Annotation pressed" message:[NSString stringWithFormat:@"It says: %@",@"annotation.title"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [av show];
    [self.delegate open:ann];
}



//-(void)openAnnotation:(id<MKAnnotation>)annotation {
//    [self.mapView selectAnnotation:annotation animated:YES];
//}

- (UIImage*) resizeImageForAnnotation:(UIImage*)image {
    return image;
    //    UIImage *annImage = [image copy];
    //
    //    CGRect resizeRect;
    //
    //    resizeRect.size = annImage.size;
    //    CGSize maxSize = CGRectInset(self.mapView.bounds,
    //                                 [self annotationPadding],
    //                                 [self annotationPadding]).size;
    //    maxSize.height -= [self calloutHeight];
    //    if (resizeRect.size.width > maxSize.width)
    //        resizeRect.size = CGSizeMake(maxSize.width, resizeRect.size.height / resizeRect.size.width * maxSize.width);
    //    if (resizeRect.size.height > maxSize.height)
    //        resizeRect.size = CGSizeMake(resizeRect.size.width / resizeRect.size.height * maxSize.height, maxSize.height);
    //
    //    resizeRect.origin = (CGPoint){0.0f, 0.0f};
    //    UIGraphicsBeginImageContext(resizeRect.size);
    //    [annImage drawInRect:resizeRect];
    //    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //
    //    return resizedImage;
}

- (MKAnnotationView*) buildAnnotationViewWithAnnotation:(id<VPPMapCustomAnnotation>)annotation reuseIdentifier:(NSString*)identifier  forMapView:(MKMapView*)theMapView {
    
    MKAnnotationView *customImageView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] ;
    
//    customImageView.image = [UIImage imageNamed:@"dianzan2"];
//    customImageView.image = [self resizeImageForAnnotation:annotation.image];
    customImageView.opaque = NO;
    [customImageView setCanShowCallout:YES];
    
    if (self.showsDisclosureButton) {
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton addTarget:self
                        action:@selector(open:)
              forControlEvents:UIControlEventTouchUpInside];
        customImageView.rightCalloutAccessoryView = rightButton;
    }
    
    return customImageView;
}

//图标~感叹号！
- (BOOL) annotationShowsDisclosureButton:(id<MKAnnotation>)annotation {
    
    if ([annotation conformsToProtocol:@protocol(VPPMapCustomAnnotation)]
        && [(id<VPPMapCustomAnnotation>)annotation respondsToSelector:@selector(showsDisclosureButton)]) {
        id<VPPMapCustomAnnotation>cust = (id<VPPMapCustomAnnotation>)annotation;
        return cust.showsDisclosureButton;
    }
    
    return self.showsDisclosureButton;
}

- (MKAnnotationView*) buildPinAnnotationViewWithAnnotation:(id<MKAnnotation>)annotation
                                           reuseIdentifier:(NSString*)identifier
                                                forMapView:(MKMapView*)theMapView {
    
    MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] ;
     customPinView.image = [UIImage imageNamed:@"dianzan2"];
    
    if ([annotation conformsToProtocol:@protocol(VPPMapCustomAnnotation)]) {
        [customPinView setPinColor:[(id<VPPMapCustomAnnotation>)annotation pinAnnotationColor]];
    }
    else {
        [customPinView setPinColor:self.pinAnnotationColor];
    }
    
    if ([annotation conformsToProtocol:@protocol(VPPMapCustomAnnotation)]
        && [(id<VPPMapCustomAnnotation>)annotation opensWhenShown]) {
//        [self performSelector:@selector(openAnnotation:) withObject:annotation afterDelay:kVPPMapHelperOpenAnnotationDelay];
    }
    
    if ([annotation conformsToProtocol:@protocol(VPPMapCustomAnnotation)]
        && [(id<VPPMapCustomAnnotation>)annotation respondsToSelector:@selector(canShowCallout)]) {
        
        id<VPPMapCustomAnnotation> cust = (id<VPPMapCustomAnnotation>)annotation;
        customPinView.canShowCallout = cust.canShowCallout;
    }
    else {
        customPinView.canShowCallout = YES;
    }
    
    if ([annotation conformsToProtocol:@protocol(VPPMapCustomAnnotation)]
        && [(id<VPPMapCustomAnnotation>)annotation respondsToSelector:@selector(animatesDrop)]) {
        id<VPPMapCustomAnnotation>cust = (id<VPPMapCustomAnnotation>)annotation;
        customPinView.animatesDrop = cust.animatesDrop;
    }
    else if (!self.shouldClusterPins) {
        [customPinView setAnimatesDrop:YES];
    }
    
    if ([self annotationShowsDisclosureButton:annotation]) {
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton addTarget:self
                        action:@selector(open:)
              forControlEvents:UIControlEventTouchUpInside];
        customPinView.rightCalloutAccessoryView = rightButton;
    }
    
    return customPinView;
}


#pragma mark -
#pragma mark MKMapViewDelegate
#pragma mark 各种大头针初始化
// configures the pin for an annotation
// 配置注释 //标注数字
- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation {
    //	NSLog(@"This is called");
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        // NSLog(@"ITs user location class");
        
//        MKAnnotationView *annoView = [[MKAnnotationView alloc]init];
//        
//        //        NSArray *arr = @[@"geren@2x.png",@"kafeiguan2@2x.png",@"kafeiguan@2x.png"];
//        annoView.image = [UIImage imageNamed:@"geren@2x.png"];
//        annoView.canShowCallout = YES;
//        return annoView;
        return nil;
    }
    
    if ([annotation isKindOfClass:[VPPMapCluster class]]) {
        VPPMapClusterView *clusterView = (VPPMapClusterView *)[theMapView dequeueReusableAnnotationViewWithIdentifier:@"cluster"];

        if (!clusterView) {
            
            clusterView = [[VPPMapClusterView alloc] initWithAnnotation:annotation reuseIdentifier:@"cluster"] ;
        
        }
        
        clusterView.title = [NSString stringWithFormat:@"%ld",(unsigned long)[[(VPPMapCluster*)annotation annotations] count]];

        clusterView.canShowCallout = NO;
        

        clusterView.userInteractionEnabled = YES;
        clusterView.clipsToBounds = NO;

        return clusterView;
    }
    
    
    
    // annotation must have an image instead of pin icon
    if ([annotation conformsToProtocol:@protocol(VPPMapCustomAnnotation)]
        && [annotation respondsToSelector:@selector(image)]
        && ((id<VPPMapCustomAnnotation>)annotation).image != nil) {
        static NSString *imageLocationAnnotationIdentifier = @"ImageMapAnnotationIdentifier";
        MKPinAnnotationView *imagePinView = (MKPinAnnotationView *)[theMapView dequeueReusableAnnotationViewWithIdentifier:imageLocationAnnotationIdentifier];
//        imagePinView.image = [UIImage imageNamed:@"dianzan2"];
        if (!imagePinView) {
            return [self buildAnnotationViewWithAnnotation:(id<VPPMapCustomAnnotation>)annotation
                                           reuseIdentifier:imageLocationAnnotationIdentifier
                                                forMapView:theMapView];
        }
        else {
            imagePinView.image = [self resizeImageForAnnotation:((id<VPPMapCustomAnnotation>)annotation).image];
//            imagePinView.image = [UIImage imageNamed:@"dianzan2"];
            imagePinView.annotation = annotation;
        }
        return imagePinView;
    }
    
    
    // annotation doesn't have custom image
    static NSString *locationAnnotationIdentifier = @"MapAnnotationIdentifier";
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[theMapView dequeueReusableAnnotationViewWithIdentifier:locationAnnotationIdentifier];

    if (!pinView) {

        return [self buildPinAnnotationViewWithAnnotation:annotation
                                          reuseIdentifier:locationAnnotationIdentifier
                                               forMapView:theMapView];
    }
    
    else {
        if ([annotation conformsToProtocol:@protocol(VPPMapCustomAnnotation)]) {
            [pinView setPinColor:[(id<VPPMapCustomAnnotation>)annotation pinAnnotationColor]];
        }
        else {
            [pinView setPinColor:self.pinAnnotationColor];
        }
        pinView.annotation = annotation;
//        pinView.image = [UIImage imageNamed:@"dianzan2"];
    }
    
    
    if ([annotation conformsToProtocol:@protocol(VPPMapCustomAnnotation)]
        && [(id<VPPMapCustomAnnotation>)annotation opensWhenShown]) {
        [self performSelector:@selector(openAnnotation:) withObject:annotation afterDelay:kVPPMapHelperOpenAnnotationDelay];
    }
    
    return pinView;
}
#pragma mark -
#pragma mark 
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
//    NSLog(@"~~~~~~~~~~~~~~~~~~");
    if ([view isKindOfClass:[VPPMapClusterView class]]) {
        
//        NSLog(@"点击了自定义的View哦！！");
////        self.
//        NSLog(@"view.annotation.coordinate.latitude = %f", view.annotation.coordinate.latitude);
//        NSLog(@"view.annotation.coordinate.longitude = %f", view.annotation.coordinate.longitude);
//        
//        NSLog(@"latitudeDelta = %f", mapView.region.span.latitudeDelta);
//         NSLog(@"longitudeDelta = %f", mapView.region.span.longitudeDelta);
//        NSLog(@"longitudeDelta = %f", mapView.RegionSpan.longitudeDelta);
        
        MKCoordinateRegion center1;

        center1.center.latitude = view.annotation.coordinate.latitude;
        center1.center.longitude = view.annotation.coordinate.longitude;
        
        center1.span.latitudeDelta = mapView.region.span.latitudeDelta;
        center1.span.longitudeDelta = mapView.region.span.longitudeDelta;
//        center1.span = {mapView.region.span.atitudeDelta,mapView.region.span.longitudeDelta};
        
        [self locateToCenter:(MKCoordinateRegion)center1];
        
        
    }else{
//        NSLog(@"11111111111111111");
    }
}


- (MKCoordinateRegion) regionAccordingToAnnotations:(NSArray*)annotations {
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    CLLocationCoordinate2D currentCoordinate;
    
    float minLatitude = -9999;
    float minLongitude = -9999;
    float maxLatitude = 9999;
    float maxLongitude = 9999;
    for (id<MKAnnotation> ann in annotations) {
        if ([ann isKindOfClass:[MKUserLocation class]]) {
            continue;
        }
        
        currentCoordinate = ann.coordinate;
        if (minLatitude == -9999 || minLongitude == -9999) {
            minLatitude = currentCoordinate.latitude;
            minLongitude = currentCoordinate.longitude;
        }
        if (maxLatitude == 9999 || maxLongitude == 9999) {
            maxLatitude = currentCoordinate.latitude;
            maxLongitude = currentCoordinate.longitude;
        }
        
        if (currentCoordinate.latitude < minLatitude) {
            minLatitude = currentCoordinate.latitude;
        }
        if (currentCoordinate.longitude < minLongitude) {
            minLongitude = currentCoordinate.longitude;
        }
        if (currentCoordinate.latitude > maxLatitude) {
            maxLatitude = currentCoordinate.latitude;
        }
        if (currentCoordinate.longitude > maxLongitude) {
            maxLongitude = currentCoordinate.longitude;
        }
    }
    
    CLLocation *min = [[CLLocation alloc] initWithLatitude:minLatitude longitude:minLongitude];
    CLLocation *max = [[CLLocation alloc] initWithLatitude:maxLatitude longitude:maxLongitude];
    CLLocationDistance dist = [max distanceFromLocation:min];
//    [max release];
//    [min release];
    
    region.center.latitude = (minLatitude + maxLatitude) / 2.0;
    region.center.longitude = (minLongitude	+ maxLongitude) / 2.0;
    region.span.latitudeDelta = dist / 111319.5; // magic number !! :)
    // explanation here: http://developer.apple.com/library/ios/#documentation/MapKit/Reference/MapKitDataTypesReference/Reference/reference.html
    region.span.longitudeDelta = 0.0;
    
    return region;
    
}

#pragma mark - Centering map stuff

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    if (self.centersOnUserLocation) {
        [self centerMap];
    }
}

- (void) centerOnCoordinate:(CLLocationCoordinate2D)coordinate {
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    
    region.center = coordinate;
    
    if (self.mapRegionSpan.latitudeDelta != 0.0 && self.mapRegionSpan.longitudeDelta != 0.0) {
        region.span = self.mapRegionSpan;
    }
    else {
        region.span.longitudeDelta = kVPPMapHelperLongitudeDelta;
        region.span.latitudeDelta = kVPPMapHelperLatitudeDelta;
    }
    
    [self.mapView setRegion:region animated:YES];
}

- (void) centerMap {
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    CLLocationCoordinate2D currentCoordinate;
    
    if (self.centersOnUserLocation) {
        CLLocation *userLocation = self.mapView.userLocation.location;
        
        [self centerOnCoordinate:userLocation.coordinate];
        return;
    }
    
    else if ([self.mapView.annotations count] > 1) {
        region = [self regionAccordingToAnnotations:self.mapView.annotations];
    }
    
    else if ([self.mapView.annotations count] == 1) {
        currentCoordinate = [[self.mapView.annotations objectAtIndex:0] coordinate];
        
        region.center = currentCoordinate;
        
        region.span.longitudeDelta = kVPPMapHelperOnePinLongitudeDelta;
        region.span.latitudeDelta = kVPPMapHelperOnePinLatitudeDelta;
    }
    
    else {
        return;
    }
    
    
    [self.mapView setRegion:region animated:YES];	
}

#pragma mark - Clustering stuff
- (void) mapView:(MKMapView *)mmapView didAddAnnotationViews:(NSArray *)views {
    if (self.pinsToRemove != nil) {
        [mmapView removeAnnotations:self.pinsToRemove];
//        [_pinsToRemove release];
        self.pinsToRemove = nil;
    }
}

- (BOOL) mapViewDidZoom:(MKMapView*)mmapView  {
    if (_currentZoom == mmapView.visibleMapRect.size.width * mmapView.visibleMapRect.size.height) {
        return NO;
    }
    
    _currentZoom = mmapView.visibleMapRect.size.width * mmapView.visibleMapRect.size.height;
    return YES;
}

- (void) mapView:(MKMapView *)mmapView regionDidChangeAnimated:(BOOL)animated {
    if (self.shouldClusterPins && [self.unfilteredPins count] != 0 && [self mapViewDidZoom:mmapView]) {
        VPPMapClusterHelper *mh = [[VPPMapClusterHelper alloc] initWithMapView:self.mapView];
        [mh clustersForAnnotations:self.unfilteredPins distance:self.distanceBetweenPins completion:^(NSArray *data) {
//            if (_pinsToRemove != nil) {
//                [_pinsToRemove release];
//            }
//            NSLog(@"%@",data);
            self.pinsToRemove = [[NSMutableArray alloc] initWithArray:self.mapView.annotations];
            [self.pinsToRemove removeObjectsInArray:data];
            [self.mapView addAnnotations:data];
        }];
//        [mh release];
    }
}

#pragma mark - Managing annotations
// sets all annotations and initializes map.

- (void)setMapAnnotations:(NSArray*)mapAnnotations {
    // removes all previous annotations
    NSArray *annotations = [NSArray arrayWithArray:self.mapView.annotations];
    [self.mapView removeAnnotations:annotations];
    
    [self addMapAnnotations:mapAnnotations];
//    NSLog(@"%@",mapAnnotations[5]);
    if (self.shouldClusterPins) {
        [self.unfilteredPins removeAllObjects];
        [self.mapView setRegion:[self regionAccordingToAnnotations:mapAnnotations] animated:YES];
    }
    else {
        [self centerMap];
    }
}


// adds more annotations
- (void)addMapAnnotations:(NSArray*)mapAnnotations {
    if (self.shouldClusterPins) {
        VPPMapClusterHelper *mh = [[VPPMapClusterHelper alloc] initWithMapView:self.mapView];
        [mh clustersForAnnotations:mapAnnotations distance:self.distanceBetweenPins completion:^(NSArray *data) {
            [self.unfilteredPins addObjectsFromArray:mapAnnotations];
            [self.mapView addAnnotations:data];
        }];
//        [mh release];
    }
    
    else {
        [self.mapView addAnnotations:mapAnnotations];
    }
}

#pragma mark -
#pragma mark 地图中心显示
-(void)locateToCenter:(MKCoordinateRegion)center1
{
    //    设置地图中心的，纬度  经度
    CLLocationCoordinate2D center = center1.center;
    //    设置地图显示的范围
    MKCoordinateSpan span = center1.span;
    //    地图范围显示的越小 细节越清楚
    span.latitudeDelta = span.latitudeDelta*0.6;
    span.longitudeDelta = span.longitudeDelta*0.6;
    //    创建MKCoordinateRegion对象,该对象代表地图显示中心和显示范围
    MKCoordinateRegion region = {center,span};
    //    设置当前地图的显示中心和显示范围
    [self.mapView setRegion:region animated:YES];
//    NSLog(@"用户当前是否位于地图中：%d" , self.mapView.userLocationVisible);
}


@end
