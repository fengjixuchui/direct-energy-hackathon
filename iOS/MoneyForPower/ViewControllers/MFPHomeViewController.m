//
//  MFPHomeViewController.m
//  MoneyForPower
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "MFPHomeViewController.h"


@interface MFPHomeViewController ()

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
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    /*
     // instanciating ViewController from StoryBoard
     UIStoryboard *storyboard = self.storyboard ?: [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"VIEWCONTROLLERIDENTIFIER"];
    
    // switching segue called
    if ([segue.identifier isEqualToString:@"HomeToTuto"])
        ;
    
    // accessing segue destination view controller
    UIViewController * targetVC = segue.destinationViewController;
    
    if (nil != targetVC) {
        //Do preparations here
    }
     */
}

- (IBAction)goTuto:(id)sender
{
    [self performSegueWithIdentifier:@"HomeToTuto" sender:self];
}

- (IBAction)goAuth:(id)sender
{
    [self performSegueWithIdentifier:@"HomeToAuth" sender:self];
}

- (IBAction)goDevices:(id)sender
{
    [self performSegueWithIdentifier:@"HomeToDevices" sender:self];
}

- (IBAction)goConso:(id)sender
{
    [self performSegueWithIdentifier:@"HomeToConso" sender:self];
}

@end
