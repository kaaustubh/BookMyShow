//
//  CustomTableViewCell.h
//  TestApp
//
//  Created by Kaustubh on 3/28/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"
#import "LazyLoadingImageView.h"

@interface CustomTableViewCell : UITableViewCell

@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *titleText;
-(void)setObject:(Place*)place;

@end
