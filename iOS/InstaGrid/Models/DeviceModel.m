//
//  DeviceModel.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "DeviceModel.h"


@implementation DeviceDefinitionModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self)
    {
        // init weak typed values (NSNumber, NSDate, NSArray, NSDictionary)
        
        /*
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyyMMdd'T'HHmmssZ"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        
        if ([dictionary[@"creationDate"] isKindOfClass:[NSString self]]) {
            self.creationDate = [dateFormatter dateFromString:dictionary[@"creationDate"]];
        }
        if ([dictionary[@"modifiedDate"] isKindOfClass:[NSString self]]) {
            self.modifiedDate = [dateFormatter dateFromString:dictionary[@"modifiedDate"]];
        }
        */
    }
    return self;
}

@end


@implementation DeviceModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self)
    {
        // init weak typed values (NSNumber, NSDate, NSArray, NSDictionary)
        
        /*
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyyMMdd'T'HHmmssZ"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        
        if ([dictionary[@"creationDate"] isKindOfClass:[NSString self]]) {
            self.creationDate = [dateFormatter dateFromString:dictionary[@"creationDate"]];
        }
        if ([dictionary[@"modifiedDate"] isKindOfClass:[NSString self]]) {
            self.modifiedDate = [dateFormatter dateFromString:dictionary[@"modifiedDate"]];
        }
        */
        
        self.deviceDefinition = [DeviceDefinitionModel objectWithDictionary:[dictionary[@"deviceDefinition"] as:[NSDictionary self]]];
    }
    return self;
}

@end
