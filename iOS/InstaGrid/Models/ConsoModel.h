//
//  ConsoModel.h
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectModel.h"


@interface ConsoModel : ObjectModel

@property (strong, nonatomic) NSString *conso;
@property (strong, nonatomic) NSDate *date;

@end
