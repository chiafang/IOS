//
//  PostCellTableViewCell.h
//  FacebookNotification
//
//  Created by Alice Tsai on 4/3/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *porfileImage;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;
@property (weak, nonatomic) IBOutlet UILabel *feedtext;
@property (weak, nonatomic) IBOutlet UIImageView *feedimg;

@end
