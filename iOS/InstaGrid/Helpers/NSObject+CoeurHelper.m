//
//  NSObject+CoeurHelper.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "NSObject+CoeurHelper.h"


@implementation NSObject (CoeurHelper)

- (id)as:(Class)class
{
    if ([self isKindOfClass:class])
        return self;
    return nil;
}

@end
