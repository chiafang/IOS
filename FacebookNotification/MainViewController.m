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
@property (nonatomic, strong ) NotficationTableViewController *notificationfeedview;
@property (nonatomic, strong) PostViewController *postview;

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
    [super viewDidLoad];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.notificationfeedview];
    [self.UIViewContainer addSubview:navigationController.view];
    [self addChildViewController:navigationController];
    [navigationController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
