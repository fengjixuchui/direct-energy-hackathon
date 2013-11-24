//
//  MFPDeviceViewController.m
//  InstaGrid
//
//  Created by Antoine Cœur on 24/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import "MFPDeviceViewController.h"
#import "MFPDevicesService.h"


@interface MFPDeviceViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *typeImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *inUseImageView;
@property (strong, nonatomic) IBOutlet UIImageView *addedImageView;

@end


@implementation MFPDeviceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self bindObject:self.deviceToShow];
}

- (void)bindObject:(DeviceModel *)object
{
    self.nameLabel.text = object.deviceDefinition.name;
    self.typeImageView.image = [MFPDevicesService deviceImages][object.deviceDefinition.type];
    
    self.inUseImageView.image = [object.inUse boolValue] ? [UIImage imageNamed:@"check"] : [UIImage imageNamed:@""];
    self.addedImageView.image = [object.added boolValue] ? [UIImage imageNamed:@"check"] : [UIImage imageNamed:@""];
}

@end
