//
//  PlaceManager.h
//  TestApp
//
//  Created by Kaustubh on 26/03/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Place.h"

@interface PlaceManager : NSObject


+ (id)sharedManager;
-(void)getPlace:(NSString*)placeString withLat:(double)latitude andLang:(double)longitude radius:(int)radius Success:(void(^)(NSMutableArray *arr))success Failure: (void(^)(NSError *error))failure;

-(BOOL)addPlaceToFav:(Place*)place;
-(NSArray*) getFavPlaces;

@end
