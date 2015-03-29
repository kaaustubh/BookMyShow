//
//  LazyLoadingImageView.h
//  TestApp
//
//  Created by Kaustubh on 26/03/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LazyLoadingImageView : UIImageView 

- (id)initWithImageUrlString:(NSString*)urlString;
-(void)setURLString:(NSString*)urlstr;
-(void)setImageReference:(NSString*)reference;


@end
