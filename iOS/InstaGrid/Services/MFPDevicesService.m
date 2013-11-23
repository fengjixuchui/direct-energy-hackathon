//
//  MFPDevicesService.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "MFPDevicesService.h"
#import "NSObject+CoeurHelper.h"
#import <AFNetworking.h>


@implementation MFPDevicesService

- (void)devices
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://";
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseObjectDict = [responseObject as:[NSDictionary self]];
        if (responseObjectDict)
        {
            //InfoModel *info = [InfoModel objectWithDictionary:responseObjectDict];
            //completion(result, nil);
        }
        else
        {
            //NSError *error = [NSError errorWithDomain:@"not a dic" code:1 userInfo:nil];
            //completion(nil, error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //completion(nil, error);
    }];
}

@end
