//
//  DeviceModel.h
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectModel.h"


@interface DeviceDefinitionModel : ObjectModel

//@property (strong, nonatomic) NSDate *creationDate;
@property (strong, nonatomic) NSString *estimatedAnnualSavings;
@property (strong, nonatomic) NSNumber *id;//int
//@property (strong, nonatomic) NSDate *modifiedDate;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSNumber *version;//int

@end


@interface DeviceModel : ObjectModel

//@property (strong, nonatomic) NSDate *creationDate;
@property (strong, nonatomic) DeviceDefinitionModel *deviceDefinition;
@property (strong, nonatomic) NSNumber *id;//int
@property (strong, nonatomic) NSNumber *inUse;//bool
//@property (strong, nonatomic) NSDate *modifiedDate;
@property (strong, nonatomic) NSNumber *version;//int

@property (strong, nonatomic) NSNumber *added;//bool
@property (strong, nonatomic) NSNumber *extinct;//bool

@end
