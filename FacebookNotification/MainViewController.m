//
//  MainViewController.m
//  FacebookNotification
//
//  Created by Alice Tsai on 4/3/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController.h"
#import "NotficationTableViewController.h"
#import "PostViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *UIViewContainer;
@property (weak, nonatomic) IBOutlet UIView *UIViewNavBarTab;
@property (nonatomic, strong ) NotficationTableViewController *notificationfeedview;
@property (nonatomic, strong) PostViewController *postview;
- (IBAction)BtnNotification:(UIButton *)sender;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.notificationfeedview = [[NotficationTableViewController alloc]init];
        self.postview = [[PostViewController alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
      UIColor *myColor = [UIColor colorWithRed:73.0/255.0 green:105.0/255.0 blue:166.0/255.0 alpha:1.0];
      self.UIViewNavBarTab.backgroundColor = myColor;
    self.UIViewNavBarTab.tintColor = [UIColor whiteColor];
    
    [super viewDidLoad];



     self.notificationfeedview.view.frame = self.UIViewContainer.frame;
     self.postview.view.frame = self.UIViewContainer.frame;
    
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.notificationfeedview];

     [self.UIViewContainer addSubview:navigationController.view];
  //   [self.UIViewContainer addSubview:self.postview.view];
    
    [self.UIViewContainer bringSubviewToFront:navigationController.view];

    // self.currentSelectedButton = self.HomeButton;
    // self.currentSelectedButton.selected = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnNotification:(UIButton *)sender {
}
@end
