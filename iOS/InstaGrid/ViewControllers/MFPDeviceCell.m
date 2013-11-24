//
//  MFPDeviceCell.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import "MFPDeviceCell.h"


@interface MFPDeviceCell ()

@property (strong, nonatomic) IBOutlet UIImageView *deviceImageView;
@property (strong, nonatomic) IBOutlet UILabel *deviceLabel;

@end


@implementation MFPDeviceCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)bindObject:(DeviceModel *)object
{
    self.deviceLabel.text = object.deviceDefinition.name;
}

@end
