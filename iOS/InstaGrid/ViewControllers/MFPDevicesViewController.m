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


@interface MFPDevicesViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *devicesCollectionView;
@property (strong, nonatomic) IBOutlet MFPDevicesService *devicesService;

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
    
    [self.devicesService devices:^(NSArray *devices, NSError *error) {
        self.devicesArray = devices;
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    MainManager *manager = [MainManager sharedInstance];
    if (manager.instaGridAccepted == NO) {
        if ([self isMovingToParentViewController])
        {
            [self performSegueWithIdentifier:@"ToTutoNonAnimated" sender:self];
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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"deviceCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark actions

- (IBAction)goTuto:(id)sender
{
    [self performSegueWithIdentifier:@"ToTuto" sender:self];
}

@end
