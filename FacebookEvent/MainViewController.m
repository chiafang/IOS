//
//  MainViewController.m
//  FacebookEvent
//
//  Created by Alice Tsai on 3/14/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController.h"
#import "ContactListViewController.h"
#import "NotificationViewController.h"
#import "FacebookFeedViewController.h"
#import "MessageViewController.h"

@interface MainViewController ()
- (IBAction)onButton_Login:(UIButton *)sender;
- (IBAction)OnTapKeyboard:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *login_button;
- (IBAction)typeid:(id)sender;
- (IBAction)typepwd:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *login_container;

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}


// UI Text Field



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.loginbuttonspin stopAnimating];
    [self.login_button setEnabled:NO];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 0) {
        [self.loginbuttonspin stopAnimating];
    }
}

- (IBAction)onButton_Login:(UIButton *)sender {
    [self.loginbuttonspin startAnimating];
    [self.login_button setImage:[UIImage imageNamed:@"logging_in_button.png"] forState:UIControlStateNormal];
    
    if([self.fb_id.text isEqualToString:@"alice"] && [self.fb_pwd.text isEqualToString:@"1234"]) {

        dispatch_queue_t downloadQueue = dispatch_queue_create("downloader", NULL);
        dispatch_async(downloadQueue, ^{
            [NSThread sleepForTimeInterval:5.0];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.loginbuttonspin stopAnimating];
                // NSLog(verify id and password);
                
                // Tab bar controller
                UITabBarController *tabBarController = [[UITabBarController alloc] init];
                
                //initiate 4 Tab Contollers
                FacebookFeedViewController * FBFeedView= [[FacebookFeedViewController alloc]init];
                ContactListViewController * FBFriendListView= [[ContactListViewController alloc]init];
                NotificationViewController * NotificationView= [[NotificationViewController alloc]init];
                MessageViewController * MessageView= [[MessageViewController alloc]init];
                
    
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:FBFeedView];
                UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:FBFriendListView];
                UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:NotificationView];
                UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:MessageView];
                

                tabBarController.viewControllers = @[navigationController,navigationController1,navigationController2,navigationController3];
                navigationController.tabBarItem.title = @"Feed";
                navigationController1.tabBarItem.title = @"Friends";
                navigationController2.tabBarItem.title = @"Messages";
                navigationController3.tabBarItem.title = @"Notification";
                
                
                //[self presentViewController:navigationController animated:YES completion:nil];
                [self presentViewController:tabBarController animated:YES completion:nil];
                
                
                FBFeedView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                //[self presentViewController:FBFeedView animated:YES completion:nil];
        
                
                [NSThread sleepForTimeInterval:3.0];
                // NSlog (after 3 second, we can flip to fb feed main page);
           
                
                //create navigation controller and then initiate from fbfeedcontroller
                
                
            });
        });



    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"The password you entered is incorrect. Please try again." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
       // NSlog (if id and pwd is wrong, popup alert msg)
        
           [self.login_button setImage:[UIImage imageNamed:@"login_button_disabled.png"] forState:UIControlStateNormal];
        
    }
    
}

- (IBAction)OnTapKeyboard:(id)sender {
    [self.view endEditing:YES];

    
}
- (IBAction)typeid:(id)sender {
    
    if([self.fb_id.text isEqualToString:@""] || [self.fb_pwd.text isEqualToString:@""]) {
        [self.login_button setEnabled:false];
        
    } else {
        [self.login_button setEnabled:true];
    }
}


- (IBAction)typepwd:(id)sender {
    if([self.fb_id.text isEqualToString:@""] || [self.fb_pwd.text isEqualToString:@""]) {
        [self.login_button setEnabled:false];
    } else {
        [self.login_button setEnabled:true];
    }
}

//enable the login button when users start to edit

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.login_container.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.login_container.frame.size.height, self.login_container.frame.size.width, self.login_container.frame.size.height);
                     }
                     completion:nil];
    
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.login_container.frame = CGRectMake(0, 60, self.login_container.frame.size.width, self.login_container.frame.size.height);
                     }
                     completion:nil];
}
@end
