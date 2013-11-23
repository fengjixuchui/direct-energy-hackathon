//
//  MFPConsoViewController.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "MFPConsoViewController.h"
#import "MainManager.h"


@interface MFPConsoViewController ()

@end


@implementation MFPConsoViewController

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
    
    MainManager *manager = [MainManager sharedInstance];
    if (manager.instaGridAccepted == NO) {
        if ([self isMovingToParentViewController])
        {
            [self performSegueWithIdentifier:@"ToDevicesNonAnimated" sender:self];
        }
    }
}

- (IBAction)goDevices:(id)sender
{
    [self performSegueWithIdentifier:@"ToDevices" sender:self];
}

@end
