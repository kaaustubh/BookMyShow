//
//  DetailPlaceViewController.m
//  TestApp
//
//  Created by Kaustubh Ratnaparkhi on 3/29/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import "DetailPlaceViewController.h"
#import "MapViewController.h"
#import "PlaceManager.h"

@interface DetailPlaceViewController ()

@end

@implementation DetailPlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _placeTitleLabel.text=_place.plceName;
    _placeAddressLabel.text=_place.vicinity;
    [_placeImageview setImageReference:_place.reference];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 -(IBAction)showOnMapClicked:(id)sender
{
    [self performSegueWithIdentifier:@"MapSegueId" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"MapSegueId"])
    {
        MapViewController *mapController=[segue destinationViewController];
        mapController.placeToShowOnMap=_place;
    }
}

-(IBAction)addToFavClicked:(id)sender
{
    PlaceManager *sharedManager=[PlaceManager sharedManager];
    BOOL success=[sharedManager addPlaceToFav:_place];
}

/*

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

*/

@end
