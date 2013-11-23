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
#import "DeviceModel.h"

NSString *const consoURL = @"http://62.210.131.112:80/instagrid/api/v1/conso";
NSString *const devicesURL = @"http://62.210.131.112:80/instagrid/api/v1/devices";


@implementation MFPDevicesService

- (void)devices:(void (^)(NSArray *devices, NSError *error))completion
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = devicesURL;
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *responseObjectArray = [responseObject as:[NSArray self]];
        if (responseObjectArray)
        {
            NSArray *devices = [DeviceModel objectArrayWithArray:responseObjectArray];
            completion(devices, nil);
        }
        else
        {
            NSError *error = [NSError errorWithDomain:@"not an array" code:1 userInfo:nil];
            completion(nil, error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}

@end
