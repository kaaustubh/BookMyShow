//
//  MapViewController.m
//  TestApp
//
//  Created by Kaustubh Ratnaparkhi on 3/29/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D coordinate= CLLocationCoordinate2DMake(_placeToShowOnMap.coordinates.latitude, _placeToShowOnMap.coordinates.longitude);
    [annotation setCoordinate:_placeToShowOnMap.coordinates];
    [annotation setTitle:_placeToShowOnMap.plceName]; //You can set the subtitle too
    [self.mapView addAnnotation:annotation];
    
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = coordinate.latitude ;
    region.center.longitude = coordinate.longitude;
    MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
    [self.mapView setRegion:regionThatFits animated:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
