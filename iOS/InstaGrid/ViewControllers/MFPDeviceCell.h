//
//  MFPDeviceCell.h
//  InstaGrid
//
//  Created by Antoine Cœur on 23/11/2013.
//  Copyright (c) 2013 Gray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceModel.h"


@interface MFPDeviceCell : UICollectionViewCell

- (void)bindObject:(DeviceModel *)object;

@end
