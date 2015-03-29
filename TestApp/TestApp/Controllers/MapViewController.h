//
//  MapViewController.h
//  TestApp
//
//  Created by Kaustubh Ratnaparkhi on 3/29/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Place.h"

@interface MapViewController : UIViewController

@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) Place *placeToShowOnMap;

@end
