//
//  Place.h
//  TestApp
//
//  Created by Kaustubh Ratnaparkhi on 3/28/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Place : NSObject

@property (nonatomic, strong) NSString *placeId;
@property (nonatomic, strong) NSString *reference;
@property (nonatomic, strong) NSString *plceName;
@property (nonatomic, strong) NSString *placeIcon;
@property (nonatomic, strong) NSString *placeRating;
@property (nonatomic, strong) NSString *vicinity;
@property (nonatomic, strong) NSString *placeType;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSArray *arrOfAddress;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *webSiteUrl;
@property (nonatomic, strong) NSString *internationalPhoneNumber;
@property (nonatomic, assign) CLLocationCoordinate2D coordinates;

- (id)initWithName:(NSString *)name
          latitude:(double)lt
         longitude:(double)lg
         placeIcon:(NSString *)icn
            rating:(NSString *)rate
          vicinity:(NSString *)vic
              type:(NSString *)typ
         reference:(NSString *)ref
               url:(NSString *)www
 addressComponents:(NSString *)addComp
  formattedAddress:(NSArray *)fAddrss
formattedPhoneNumber:(NSString *)fPhone
           website:(NSString *)web
internationalPhone:(NSString *)intPhone
       searchTerms:(NSString *)search
    distanceInFeet:(NSString *)distanceFeet
   distanceInMiles:(NSString *)distanceMiles;

-(id)initWithDictionary:(NSDictionary *)placeJson andUserCoordinates:(CLLocation*)userCoords;

@end
