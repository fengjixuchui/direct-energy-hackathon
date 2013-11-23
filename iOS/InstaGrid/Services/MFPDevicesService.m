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

NSString *const aliveURL = @"http://62.210.131.112:8081/instagrid/api/v1/alive";
NSString *const devicesURL = @"http://62.210.131.112:8081/instagrid/api/v1/devices";


@implementation MFPDevicesService

- (void)devices:(void (^)(NSArray *devices, NSError *error))completion
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = devicesURL;
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseObjectDict = [responseObject as:[NSDictionary self]];
        if (responseObjectDict)
        {
            //TODO:
            //NSArray *devices = [DeviceModel objectWithDictionary:responseObjectDict];
            //completion(devices, nil);
        }
        else
        {
            NSError *error = [NSError errorWithDomain:@"not a dic" code:1 userInfo:nil];
            completion(nil, error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}

@end
