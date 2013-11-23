//
//  MFPHomeViewController.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "MFPHomeViewController.h"

NSString *const segueToTuto = @"ToTuto";
NSString *const segueToAuth = @"ToAuth";
NSString *const segueToDevices = @"ToDevices";
NSString *const segueToConso = @"ToConso";


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
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"Tuto"];
    
    // switching segue called
    if ([segue.identifier isEqualToString:@"ToTuto"]) {
    }
    
    // accessing segue destination view controller
    UIViewController * targetVC = segue.destinationViewController;
    if (targetVC != nil) {
        //Do preparations here
    }
    */
}

- (IBAction)goAuth:(id)sender
{
    [self performSegueWithIdentifier:@"ToAuth" sender:self];
}

- (IBAction)goConso:(id)sender
{
    [self performSegueWithIdentifier:@"ToConso" sender:self];
}

/*
- (IBAction)goDevices:(id)sender
{
    [self performSegueWithIdentifier:@"ToDevices" sender:self];
}
*/

- (IBAction)goTuto:(id)sender
{
    //[self performSegueWithIdentifier:@"ToTuto" sender:self];
    [self performSegueWithIdentifier:@"ToConsoNonAnimated" sender:self];
}

@end
