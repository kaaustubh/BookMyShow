//
//  DetailPlaceViewController.h
//  TestApp
//
//  Created by Kaustubh Ratnaparkhi on 3/29/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LazyLoadingImageView.h"
#import "Place.h"
#import <MapKit/MapKit.h>

@interface DetailPlaceViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel *placeTitleLabel;
@property(nonatomic, weak) IBOutlet UILabel *placeAddressLabel;
@property(nonatomic, weak) IBOutlet LazyLoadingImageView *placeImageview;
@property (nonatomic, strong) Place *place;

-(IBAction)showOnMapClicked:(id)sender;

@end
