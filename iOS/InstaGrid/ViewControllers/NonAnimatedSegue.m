//
//  NonAnimatedSegue.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import "NonAnimatedSegue.h"


@implementation NonAnimatedSegue

- (void)perform
{
    [((UIViewController *)self.sourceViewController).navigationController pushViewController:self.destinationViewController animated:NO];
}

@end
