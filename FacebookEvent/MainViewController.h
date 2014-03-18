//
//  MainViewController.h
//  FacebookEvent
//
//  Created by Alice Tsai on 3/14/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *fb_id;
@property (weak, nonatomic) IBOutlet UITextField *fb_pwd;
@property (weak, nonatomic) IBOutlet UIButton *beforelogin_button;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginbuttonspin;
@end