//
//  EditViewController.m
//  Tumblr
//
//  Created by Alice Tsai on 3/21/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

- (IBAction)onButton_nevermind:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *bg_view;
@property (weak, nonatomic) IBOutlet UIView *nevermind_bgview;



@end

@implementation EditViewController

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
    UIColor *bg = [UIColor colorWithRed:(53.0/255.0) green:(70.0/255.0) blue:(92.0/255.0) alpha:1];
    UIColor *nevermind_bg = [UIColor colorWithRed:(61.0/255.0) green:(77.0/255.0) blue:(96.0/255.0) alpha:1];
    self.bg_view.backgroundColor = bg;
    self.bg_view.alpha = 0.95f;
    self.nevermind_bgview.backgroundColor = nevermind_bg;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButton_nevermind:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
