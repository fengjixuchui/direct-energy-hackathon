//
//  MFPDevicesViewController.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "MFPDevicesViewController.h"
#import "MFPDevicesService.h"
#import "MainManager.h"
#import "MFPDeviceCell.h"
#import "MFPDeviceViewController.h"


@interface MFPDevicesViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *devicesCollectionView;
@property (strong, nonatomic) IBOutlet MFPDevicesService *devicesService;

@property (strong, nonatomic) DeviceModel *deviceToShow;

@end


@implementation MFPDevicesViewController

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
    
    [self.devicesCollectionView registerNib:[UINib nibWithNibName:@"MFPDeviceCell" bundle:nil] forCellWithReuseIdentifier:@"deviceCell"];
    
    self.devicesService = [MFPDevicesService new];
    [self.devicesService devices:^(NSArray *devices, NSError *error) {
        self.devicesArray = devices;
    }];
}

#pragma mark lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    MainManager *manager = [MainManager sharedInstance];
    if (manager.instaGridAccepted == NO) {
        if ([self isMovingToParentViewController]) {
            NSLog(@"a");
            //[self performSegueWithIdentifier:@"ToTutoNonAnimated" sender:self];
        }
        else {
            NSLog(@"b");
            [self.navigationController popToRootViewControllerAnimated:NO];
        }
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    MainManager *manager = [MainManager sharedInstance];
    if (manager.instaGridAccepted == NO) {
        if ([self isMovingToParentViewController]) {
            [self performSegueWithIdentifier:@"ToTutoNonAnimated" sender:self];
        }
        else {
            //[self.navigationController popToRootViewControllerAnimated:NO];
        }
    }
}

#pragma mark setters & getters

- (void)setDevicesArray:(NSArray *)devicesArray
{
    _devicesArray = devicesArray;
    
    [self.devicesCollectionView reloadData];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_devicesArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MFPDeviceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"deviceCell" forIndexPath:indexPath];
    
    [cell bindObject:_devicesArray[indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DeviceModel *device = _devicesArray[indexPath.row];
    
    /*
    // switch added state
    device.added = @(![device.added boolValue]);
    
    // refresh cell
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
    */
    
    // showing detail page
    self.deviceToShow = device;
    [self performSegueWithIdentifier:@"ToDevice" sender:self];
}

/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout  *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Adjust cell size for orientation
    if (UIDeviceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(170.f, 170.f);
    }
    return CGSizeMake(192.f, 192.f);
}

#pragma mark rotations

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.devicesCollectionView performBatchUpdates:nil completion:nil];
}
*/

#pragma mark actions

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
     // switching segue called
     if ([segue.identifier isEqualToString:@"ToDevice"]) {
         // accessing segue destination view controller
         MFPDeviceViewController * targetVC = segue.destinationViewController;
         if (targetVC != nil) {
             // do preparations here
             targetVC.deviceToShow = self.deviceToShow;
         }
     }
}

- (IBAction)goTuto:(id)sender
{
    [self performSegueWithIdentifier:@"ToTuto" sender:self];
}

@end
