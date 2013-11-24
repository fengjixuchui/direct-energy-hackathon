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
@property (strong, nonatomic) IBOutlet UIImageView *extinctImageView;
@property (strong, nonatomic) IBOutlet UISwitch *addedSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *extinctSwitch;

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
    self.extinctImageView.image = [object.extinct boolValue] ? [UIImage imageNamed:@"check"] : [UIImage imageNamed:@""];
    self.addedSwitch.on = [self.deviceToShow.added boolValue];
    self.extinctSwitch.on = [self.deviceToShow.extinct boolValue];
}

- (IBAction)added:(id)sender
{
    self.deviceToShow.added = @(self.addedSwitch.on);
}

- (IBAction)extinct:(id)sender
{
    self.deviceToShow.extinct = @(self.extinctSwitch.on);
}

@end
