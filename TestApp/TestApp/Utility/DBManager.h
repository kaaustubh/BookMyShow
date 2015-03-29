//
//  DBManager.h
//  TestApp
//
//  Created by Kaustubh Ratnaparkhi on 3/29/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Place.h"

@interface DBManager : NSObject
-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;

-(NSArray *)loadDataFromDB:(NSString *)query;
-(BOOL)executeQuery:(NSString *)query;
-(BOOL)addPlaceToDB:(Place*)place;

@end
