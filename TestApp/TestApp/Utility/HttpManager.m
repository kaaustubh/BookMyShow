//
//  HttpManager.m
//  TestApp
//
//  Created by Kaustubh on 26/03/15.
//  Copyright (c) 2015 Kaustubh. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager

+ (id)sharedManager {
    static HttpManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    self = [super init];
    return self;
}


-(void)sendRequestForURL:(NSString*)urlString Success:(void(^)(NSData *data))success Failure: (void(^)(NSError *error))failure
{
    NSURLSession *session=[NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
        if(error && failure)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                failure(error);
            });
           
        }
        else if(success)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                 success(data);
            });
        }
        
    }] resume];
}

- (void)sendRequest:(NSString *)urlString
{
    
}
@end
