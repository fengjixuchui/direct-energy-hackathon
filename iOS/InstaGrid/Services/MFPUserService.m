//
//  MFPUserService.m
//  InstaGrid
//
//  Created by Antoine Cœur on 24/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import "MFPUserService.h"
#import "NSObject+CoeurHelper.h"
#import <AFNetworking.h>

NSString *const userURL = @"http://62.210.131.112:80/instagrid/api/v1/user";


@implementation MFPUserService

- (void)user:(void (^)(NSDictionary *user, NSError *error))completion
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *url = userURL;
    [manager POST:url parameters:@{@"aa":@"aa"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseObjectDict = [responseObject as:[NSArray self]];
        if (responseObjectDict)
        {
            // TODO: complete
            //NSDictionary *user = [UserModel objectWithDictionary:responseObjectDict];
            //completion(user, nil);
        }
        else
        {
            NSError *error = [NSError errorWithDomain:@"not a dict" code:1 userInfo:nil];
            completion(nil, error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}

@end
