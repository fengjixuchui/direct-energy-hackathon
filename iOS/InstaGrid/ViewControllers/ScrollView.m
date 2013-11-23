//
//  ScrollView.m
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import "ScrollView.h"


@implementation ScrollView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // we are paging
    self.pagingEnabled = YES;
    
    // we want our content to be visible outside our bounds
    self.clipsToBounds = NO;
}

/*
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    // TODO: intersect with self.contentSize
    return [self.superview pointInside:[self convertPoint:point toView:self.superview] withEvent:event];
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    /*
    // we want a perfect height to prevent up&down scrolling
    self.contentSize = CGSizeMake(self.contentSize.width,
                                  self.bounds.size.height);
    */
    
    // TODO: find a way to automatically determine the size factor
    self.contentSize = CGSizeMake(self.bounds.size.width * 4, self.bounds.size.height);
}

@end
