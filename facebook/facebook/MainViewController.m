//
//  MainViewController.m
//  facebook
//
//  Created by Alice Tsai on 3/7/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"facebook";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.blueview.layer.cornerRadius=10;
    self.MiainContainer.layer.cornerRadius = 5;
    
    self.navigationItem.title = @"Post";
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:57.0/255.0 green:158.0/255.0 blue:209.0/255.0 alpha:1.0];
/*
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Left" style: UIBarButtonItemStylePlain target:nil action:nil];
*/
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_left.png"] style:UIBarButtonItemStyleBordered target:self action:nil];
    
    self.navigationItem.leftBarButtonItem =leftButton;
 
/*
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Right" style: UIBarButtonItemStylePlain target:nil action:nil];
*/
   UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_search.png"] style:UIBarButtonItemStyleBordered target:self action:nil];
    self.navigationItem.rightBarButtonItem =rightButton;
    


    
}
                                    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
