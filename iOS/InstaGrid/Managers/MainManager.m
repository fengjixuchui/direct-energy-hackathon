//
//  MainManager.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import "MainManager.h"


@implementation MainManager

+(instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)setInstaGridAccepted:(BOOL)anInstaGridAccepted
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:anInstaGridAccepted forKey:@"instaGridAccepted"];
    [defaults synchronize];
}

- (BOOL)instaGridAccepted
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:@"instaGridAccepted"];
}

@end
