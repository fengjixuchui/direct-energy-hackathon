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

NSString *const devicesURL = @"http://62.210.131.112:80/instagrid/api/v1/devices";
NSString *const orderURL = @"http://62.210.131.112:80/instagrid/api/v1/savings/order";


@implementation MFPDevicesService

+(NSDictionary *)deviceImages
{
    static NSMutableDictionary *dic = nil;
    
    if (dic == nil)
    {
        dic = [NSMutableDictionary new];
        [dic setObject:[UIImage imageNamed:@"air_conditioning_internal"] forKey:@"AC"];
        [dic setObject:[UIImage imageNamed:@"boiler_flame"] forKey:@"BOILER"];
        [dic setObject:[UIImage imageNamed:@"dryer"] forKey:@"DRYER"];
        [dic setObject:[UIImage imageNamed:@"electric_car"] forKey:@"CAR"];
        [dic setObject:[UIImage imageNamed:@"freezer_B"] forKey:@"FREEZER"];
        [dic setObject:[UIImage imageNamed:@"lightbulb"] forKey:@"LIGHT"];
        [dic setObject:[UIImage imageNamed:@"tv_flat_play"] forKey:@"TV"];
        [dic setObject:[UIImage imageNamed:@"washing_machine"] forKey:@"WASHING_MACHINE"];
    }
    
    return dic;
}

- (void)devices:(void (^)(NSArray *devices, NSError *error))completion
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
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
