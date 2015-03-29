//
//  ViewController.m
//  TestApp
//
//  Created by Kaustubh on 26/03/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "PlaceManager.h"
#import "PlaceListViewController.h"
#import "MBProgressHUD.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *latestLocation;
@property (strong, nonatomic) NSString *selectedPlaceType;
@property (strong, nonatomic) NSMutableArray *placesArr;

@end

@implementation ViewController

NSMutableArray *place;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
      //  [_locationManager startUpdatingLocation];
    _locationManager.delegate=self;
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager requestAlwaysAuthorization];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    [self getPlaces];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    _latestLocation=locations[locations.count-1];
}

-(CLLocation*)getCurrentLocation
{
    CLLocation *currentLocation;
    [_locationManager startUpdatingLocation];
    currentLocation=[_locationManager location];
    [_locationManager stopUpdatingLocation];
    return currentLocation;
}


-(void)getPlaces
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Places" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error;
    place = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma TableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return place.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"TableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [place objectAtIndex:indexPath.row];
    return cell;
}

#pragma TableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self getRadiusAndPlacesForType:place[indexPath.row]];
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

-(void)getRadiusAndPlacesForType:(NSString*)type
{
    _selectedPlaceType=type;
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Enter the radius" message:@"Please enter the radius in meters" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    CLLocation *currentLocation=[self getCurrentLocation];
    double lat=currentLocation.coordinate.latitude;
    double lang=currentLocation.coordinate.longitude;
    if (buttonIndex==0){
        UITextField *textField = [alertView textFieldAtIndex:0];
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        if ([textField.text rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        {
            int radius=textField.text.intValue;
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            PlaceManager *shareManager=[PlaceManager sharedManager];
            [shareManager getPlace:[_selectedPlaceType lowercaseString] withLat: lat andLang:lang  radius:radius Success:^(NSMutableArray *nearByPlaces)
             {
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 _placesArr=nearByPlaces;
                 [self performSegueWithIdentifier:@"kPlaceListSegue" sender:self];
             }Failure:^(NSError *error) 
             {
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 UIAlertView *errorAlert=[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                 [errorAlert show];
             }];

            
        }
        else
        {
            UIAlertView *errorAlert=[[UIAlertView alloc] initWithTitle:@"Invalid Data" message:@"Please enter a valid number" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlert show];
        }
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"kPlaceListSegue"])
    {
        PlaceListViewController *pController=[segue destinationViewController];
        pController.places=_placesArr;
    }
}

-(void)showPlacesList:(NSArray*)arrPlaces
{
    
}
@end
