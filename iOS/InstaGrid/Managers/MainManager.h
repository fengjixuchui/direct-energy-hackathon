//
//  MainManager.h
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MainManager : NSObject

+(instancetype)sharedInstance;

@property (nonatomic) BOOL instaGridAccepted;
@property (strong, nonatomic) NSArray *devices;

@end
