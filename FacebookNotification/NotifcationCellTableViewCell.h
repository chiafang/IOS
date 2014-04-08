//
//  NotifcationCellTableViewCell.h
//  FacebookNotification
//
//  Created by Alice Tsai on 4/3/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotifcationCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *feedimage;
@property (weak, nonatomic) IBOutlet UITextView *notoficationfeed;
@property (weak, nonatomic) IBOutlet UILabel *feedtimestamp;

@end
