//
//  MFPHomeViewController.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "MFPHomeViewController.h"
#import "MainManager.h"
#import "MFPConsoCell.h"
#import <SMWheelControl.h>


@interface MFPHomeViewController ()

@property (strong, nonatomic) IBOutlet SMWheelControl *wheel;

@end


@implementation MFPHomeViewController

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
    
    //SMWheelControl *wheel = [[SMWheelControl alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    //self.wheel = wheel;
    //[wheel addTarget:self action:@selector(wheelDidChangeValue:) forControlEvents:UIControlEventValueChanged];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark actions

- (IBAction)goAuth:(id)sender
{
    [self performSegueWithIdentifier:@"ToAuth" sender:self];
}

- (IBAction)goConso:(id)sender
{
    MainManager *manager = [MainManager sharedInstance];
    if (manager.instaGridAccepted == NO) {
        [self performSegueWithIdentifier:@"ToConsoNonAnimated" sender:self];
    }
    else {
        [self performSegueWithIdentifier:@"ToConso" sender:self];
    }
}

@end
