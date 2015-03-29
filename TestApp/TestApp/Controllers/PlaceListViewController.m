//
//  PlaceListViewController.m
//  TestApp
//
//  Created by Kaustubh Ratnaparkhi on 3/28/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import "PlaceListViewController.h"
#import "LazyLoadingImageView.h"
#import "CustomTableViewCell.h"
#import "DetailPlaceViewController.h"

@interface PlaceListViewController()<UITableViewDataSource,UITableViewDelegate>
{

}

@property (nonatomic, strong) Place *selectedPlace;
@end



@implementation PlaceListViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    [_placesTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CustomCellIdentifier";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell =[[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell setObject:_places[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedPlace=_places[indexPath.row];
    //Make segue id as contant
    [self performSegueWithIdentifier:@"kPlaceDetailSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"kPlaceDetailSegue"])
    {
        DetailPlaceViewController *detailController=[segue destinationViewController];
        detailController.place=_selectedPlace;
    }
}


@end
