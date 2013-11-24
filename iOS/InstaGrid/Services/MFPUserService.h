//
//  MFPUserService.h
//  InstaGrid
//
//  Created by Antoine Cœur on 24/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MFPUserService : NSObject

- (void)user:(void (^)(NSDictionary *user, NSError *error))completion;

@end
