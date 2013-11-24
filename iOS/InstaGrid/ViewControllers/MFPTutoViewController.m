//
//  MFPTutoViewController.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "MFPTutoViewController.h"
#import "MainManager.h"


@interface MFPTutoViewController ()
<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *tutoScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *tutoPageControl;

@property (weak, nonatomic) IBOutlet UIButton *subscribeButton;
@property (weak, nonatomic) IBOutlet UIButton *unsubscribeButton;

@end


@implementation MFPTutoViewController

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
    self.unsubscribeButton.hidden = !manager.instaGridAccepted;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - UIScrollViewDelegate methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = ceil(scrollView.contentOffset.x / scrollView.frame.size.width);
    self.tutoPageControl.currentPage = page;
}

#pragma mark actions

- (IBAction)subscribe:(id)sender {
    MainManager *manager = [MainManager sharedInstance];
    manager.instaGridAccepted = YES;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)unsubscribe:(id)sender {
    MainManager *manager = [MainManager sharedInstance];
    manager.instaGridAccepted = NO;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
