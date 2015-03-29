//
//  PlaceManager.m
//  TestApp
//
//  Created by Kaustubh on 26/03/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import "PlaceManager.h"
#import "HttpManager.h"
#import "DBManager.h"
#import "Place.h"
@implementation PlaceManager

#define kBaseURLString @"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%ld,%ld&radius=%d&types=%@&key=%@"
#define kKey @"AIzaSyDmPHKWgM1weV5WQh93vddNHPrd5Dm9N1Y"
#define kDBName @"favplacedb.sql"



+ (id)sharedManager {
    static PlaceManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(void)getPlace:(NSString*)placeString withLat:(double)latitude andLang:(double)longitude radius:(int)radius Success:(void(^)(NSMutableArray *arr))success Failure: (void(^)(NSError *error))failure
{
    NSString *urlString=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=%d&types=%@&key=%@", latitude, longitude, radius,placeString,kKey];
    HttpManager *sharedManager=[HttpManager sharedManager];
    [sharedManager sendRequestForURL:urlString Success:^(NSData *data)
     {
         @autoreleasepool {
             NSMutableArray *placeObjectsArray=[NSMutableArray array];
             NSError *error = nil;
             Place *place;
             NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
             if (error != nil) {
                 if (failure) {
                     failure([self getInvalidDataError]);
                 }
             }
             else {
                 NSString *responseStatus = [NSString stringWithFormat:@"%@",[jsonArray objectForKey:@"status"]];
                 
                 if ([responseStatus caseInsensitiveCompare:@"Ok"]== NSOrderedSame  )
                 {
                     NSArray *jsonPlacesArr=[jsonArray objectForKey:@"results"];
                     if (jsonPlacesArr.count>0)
                     {
                         for (NSDictionary *placeDict in jsonPlacesArr) {
                             CLLocation *location=[[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
                             place=[[Place alloc] initWithDictionary:placeDict andUserCoordinates:location];
                             [placeObjectsArray addObject:place];
                         }
                         
                         if (success) {
                             success(placeObjectsArray);
                         }
                         
                     }
                     else
                     {
                         if (failure) {
                             failure([self getNoResultsError]);
                         }
                     }
                 }
                 else
                 {
                     if (failure) {
                         failure([self getNoResultsError]);
                     }
                 }
             }
             
         }
         
     }
    Failure:^(NSError *error)
     {
         if (failure) {
             failure(error);
         }
     }];
}

-(NSError *)getInvalidDataError
{
    NSError *responseError = [NSError errorWithDomain:@"Invalid response from the server"
                                                 code:500
                                             userInfo:nil];
    return responseError;
}


-(NSError *)getNoResultsError
{
    NSError *responseError = [NSError errorWithDomain:@"No results from the server"
                                                 code:404
                                             userInfo:nil];
    return responseError;
}

-(BOOL)addPlaceToFav:(Place*)place
{
    DBManager *manager=[[DBManager alloc] initWithDatabaseFilename:kDBName];
    return [manager addPlaceToDB:place];
    
}



@end
