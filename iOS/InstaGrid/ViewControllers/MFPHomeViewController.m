//
//  MFPHomeViewController.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "MFPHomeViewController.h"
#import "MainManager.h"

NSString *const segueToTuto = @"ToTuto";
NSString *const segueToAuth = @"ToAuth";
NSString *const segueToDevices = @"ToDevices";
NSString *const segueToConso = @"ToConso";


@interface MFPHomeViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *consoArray; // of ConsoModel
@property (weak, nonatomic) IBOutlet UICollectionView *consoCollectionView;

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
    
    [self.consoCollectionView registerNib:[UINib nibWithNibName:@"MFPConsoCell" bundle:nil] forCellWithReuseIdentifier:@"consoCell"];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_consoArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"consoCell" forIndexPath:indexPath];
    
    return cell;
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
