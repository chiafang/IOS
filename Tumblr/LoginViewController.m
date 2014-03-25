//
//  LoginViewController.m
//  Tumblr
//
//  Created by Alice Tsai on 3/21/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *id_field;
@property (weak, nonatomic) IBOutlet UITextField *pw_field;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UIButton *login;
- (IBAction)cancel_button:(UIButton *)sender;
- (IBAction)login_button:(UIButton *)sender;

@end

@implementation LoginViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel_button:(UIButton *)sender {
       [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)login_button:(UIButton *)sender {
     if([self.id_field.text isEqualToString:@"alice@yahoo-inc.com"] && [self.pw_field.text isEqualToString:@"1234"]) {
      //   self.tabBarController.selectedIndex = 1;
      //   [self dismissViewControllerAnimated:YES completion:nil];
     } else {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"The password you entered is incorrect. Please try again." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
         [alert show];
         
    
}
}
@end
