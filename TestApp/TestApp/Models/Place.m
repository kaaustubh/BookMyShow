//
//  Place.m
//  TestApp
//
//  Created by Kaustubh Ratnaparkhi on 3/28/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import "Place.h"

@implementation Place

-(id)initWithName:(NSString *)name
          placeid:(NSString*)placeId
         latitude:(double)lt
        longitude:(double)lg
        placeIcon:(NSString *)icon
           rating:(NSString *)rating
         vicinity:(NSString *)vicinity
             type:(NSArray *)type
        reference:(NSString *)ref
              url:(NSString *)placeURL
addressComponents:(NSArray *)addComp
formattedAddress:(NSString *)pAddress
formattedPhoneNumber:(NSString *)fPhone
          website:(NSString *)web
internationalPhone:(NSString *)intPhone
   distanceInFeet:(NSString *)distanceFeet
  distanceInMiles:(NSString *)distanceMiles
{
    
    if (self = [super init])
    {
        _plceName=name;
        _placeId=placeId;
        _placeIcon=icon;
        _placeRating=rating;
        _vicinity=vicinity;
        _placeType=type;
        _reference=ref;
        _url=placeURL;
        _arrOfAddress=addComp;
        _address=pAddress;
        _phoneNumber=fPhone;
        _webSiteUrl=web;
        _internationalPhoneNumber=intPhone;
        _coordinates=CLLocationCoordinate2DMake(lt, lg);
        
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary *)placeJson andUserCoordinates:(CLLocation*)userCoords
{
    NSDictionary *geo = [placeJson objectForKey:@"geometry"];
    NSDictionary *loc = [geo objectForKey:@"location"];
    
    //Figure out Distance from POI and User
    CLLocation *poi = [[CLLocation alloc] initWithLatitude:[[loc objectForKey:@"lat"] doubleValue]  longitude:[[loc objectForKey:@"lng"] doubleValue]];
    CLLocation *user = poi;
    CLLocationDistance inFeet = ([user distanceFromLocation:poi]) * 3.2808;
    
    CLLocationDistance inMiles = ([user distanceFromLocation:poi]) * 0.000621371192;
    
    NSString *distanceInFeet = [NSString stringWithFormat:@"%.f", round(2.0f * inFeet) / 2.0f];
    NSString *distanceInMiles = [NSString stringWithFormat:@"%.2f", inMiles];
    
    
    return [self initWithName:[placeJson objectForKey:@"name"] placeid:[placeJson objectForKey:@"place_id"] latitude:[[loc objectForKey:@"lat"] doubleValue] longitude:[[loc objectForKey:@"lng"] doubleValue] placeIcon:[placeJson objectForKey:@"icon"]  rating:[placeJson objectForKey:@"rating"] vicinity:[placeJson objectForKey:@"vicinity"] type:[placeJson objectForKey:@"types"] reference:[placeJson objectForKey:@"reference"] url:[placeJson objectForKey:@"url"] addressComponents:[placeJson objectForKey:@"address_components"] formattedAddress:[placeJson objectForKey:@"formatted_address"] formattedPhoneNumber:[placeJson objectForKey:@"formatted_phone_number"] website:[placeJson objectForKey:@"website"] internationalPhone:[placeJson objectForKey:@"international_phone_number"] distanceInFeet:distanceInFeet distanceInMiles:distanceInMiles];
}

@end
