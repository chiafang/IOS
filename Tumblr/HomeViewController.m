//
//  HomeViewController.m
//  Tumblr
//
//  Created by Alice Tsai on 3/21/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()
- (IBAction)onButtonLogin:(id)sender;
@property (nonatomic, strong   ) LoginViewController *loginview;

@end

@implementation HomeViewController

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
    self.loginview = [[LoginViewController alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonLogin:(id)sender {
    [self presentViewController:self.loginview animated:YES completion:nil];
    
    
    self.loginview.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    
    
    
}
@end
