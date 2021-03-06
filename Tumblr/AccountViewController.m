//
//  AccountViewController.m
//  Tumblr
//
//  Created by Alice Tsai on 3/21/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "AccountViewController.h"
#import "LoginViewController.h"

@interface AccountViewController ()
@property (nonatomic, strong   ) LoginViewController *loginview;
@property (weak, nonatomic) IBOutlet UIView *bg_view;

- (IBAction)OnButton_signin:(id)sender;
- (IBAction)onButton_login:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *bg_color;


@end

@implementation AccountViewController

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
    
    UIColor *bg = [UIColor colorWithRed:(53.0/255.0) green:(70.0/255.0) blue:(92.0/255.0) alpha:1];
    self.bg_color.backgroundColor = bg;
 

    

    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnButton_signin:(id)sender {
}

- (IBAction)onButton_login:(id)sender {

    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:self.loginview animated:YES completion:nil];
  //  self.loginview.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    


    
}
@end
