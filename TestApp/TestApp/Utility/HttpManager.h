//
//  HttpManager.h
//  TestApp
//
//  Created by Kaustubh on 26/03/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpManagerDelegate <NSObject>

//- (void)httpManagerDidFinishLoadingImage:(NSData *)data;
//
//- (void)httpManagerDidFailLoadingImage:(NSError *)error;
@end

@interface HttpManager : NSObject 

-(void)sendRequestForURL:(NSString*)urlString Success:(void(^)(NSData *data))success Failure: (void(^)(NSError *error))failure;
+ (id)sharedManager ;

@end
