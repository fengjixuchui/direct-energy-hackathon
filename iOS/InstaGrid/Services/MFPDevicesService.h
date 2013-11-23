//
//  MFPDevicesService.h
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MFPDevicesService : NSObject

- (void)devices:(void (^)(NSArray *devices, NSError *error))completion;

@end
