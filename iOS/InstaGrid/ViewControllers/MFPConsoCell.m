//
//  MFPConsoCell.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import "MFPConsoCell.h"


@interface MFPConsoCell ()

@property (strong, nonatomic) IBOutlet UIImage *deviceImage;
@property (strong, nonatomic) IBOutlet UILabel *deviceLabel;

@end


@implementation MFPConsoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)bindObject:(ConsoModel *)object
{
    // TODO:
}

@end
