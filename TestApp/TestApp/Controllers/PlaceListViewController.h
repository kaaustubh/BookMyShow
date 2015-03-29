//
//  PlaceListViewController.h
//  TestApp
//
//  Created by Kaustubh Ratnaparkhi on 3/28/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceListViewController : UIViewController

@property (nonatomic, strong) NSArray *places;
@property (nonatomic, weak) IBOutlet UITableView *placesTableView;

@end
