//
//  MFPConsoViewController.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "MFPConsoViewController.h"
#import "MainManager.h"
#import "MFPConsoCell.h"


@interface MFPConsoViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *consoArray; // of ConsoModel
@property (weak, nonatomic) IBOutlet UICollectionView *consoCollectionView;

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

#pragma mark lifecycle

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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark setters & getters

- (void)setDevicesArray:(NSArray *)devicesArray
{
    _consoArray = devicesArray;
    
    [self.consoCollectionView reloadData];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_consoArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MFPConsoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"consoCell" forIndexPath:indexPath];
    
    [cell bindObject:_consoArray[indexPath.row]];
    
    return cell;
}

#pragma mark actions

- (IBAction)goDevices:(id)sender
{
    [self performSegueWithIdentifier:@"ToDevices" sender:self];
}

@end
