//
//  MFPTutoViewController.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#import "MFPTutoViewController.h"


@interface MFPTutoViewController ()
<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *tutoScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *tutoPageControl;

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
    
    self.tutoScrollView.contentSize = CGSizeMake(self.tutoScrollView.bounds.size.width * 2, self.tutoScrollView.bounds.size.height);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tutoScrollView.contentSize = CGSizeMake(self.tutoScrollView.bounds.size.width * 2, self.tutoScrollView.bounds.size.height);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.tutoScrollView.contentSize = CGSizeMake(self.tutoScrollView.bounds.size.width * 2, self.tutoScrollView.bounds.size.height);
}

#pragma mark - UIScrollViewDelegate methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = ceil(scrollView.contentOffset.x / scrollView.frame.size.width);
    self.tutoPageControl.currentPage = page;
}

@end
