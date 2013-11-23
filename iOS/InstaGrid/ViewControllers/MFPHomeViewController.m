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
<UICollectionViewDataSource,
UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *consoArray; // of ConsoModel
@property (weak, nonatomic) IBOutlet UICollectionView *consoCollectionView;
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
    
    [self.consoCollectionView registerNib:[UINib nibWithNibName:@"MFPConsoCell" bundle:nil] forCellWithReuseIdentifier:@"consoCell"];
    
    //SMWheelControl *wheel = [[SMWheelControl alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    //self.wheel = wheel;
    //[wheel addTarget:self action:@selector(wheelDidChangeValue:) forControlEvents:UIControlEventValueChanged];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
