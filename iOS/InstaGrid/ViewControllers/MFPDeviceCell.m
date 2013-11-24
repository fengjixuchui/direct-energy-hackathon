//
//  MFPDeviceCell.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import "MFPDeviceCell.h"
#import "MFPDevicesService.h"


@interface MFPDeviceCell ()

@property (strong, nonatomic) IBOutlet UIImageView *typeImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *inUseImageView;
@property (strong, nonatomic) IBOutlet UIImageView *addedImageView;

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
    self.nameLabel.text = object.deviceDefinition.name;
    self.typeImageView.image = [MFPDevicesService deviceImages][object.deviceDefinition.type];
    
    self.inUseImageView.image = [object.inUse boolValue] ? [UIImage imageNamed:@"check"] : [UIImage imageNamed:@""];
    self.addedImageView.image = [object.added boolValue] ? [UIImage imageNamed:@"check"] : [UIImage imageNamed:@""];
}

@end
