//
//  FacebookFeedViewController.m
//  FacebookEvent
//
//  Created by Alice Tsai on 3/14/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "FacebookFeedViewController.h"

@interface FacebookFeedViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinicon;
@property (weak, nonatomic) IBOutlet UIScrollView *UIFeedView;


@end

@implementation FacebookFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    
    self.navigationItem.title = @"News Feed";
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"newsfeedtitle.png"]];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:73.0/255.0 green:105.0/255.0 blue:166.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.translucent = NO;
    // configure navigation bar background color
    

    // Configure nav left button
    UIBarButtonItem *LeftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"magnifier.png"] style:UIBarButtonItemStylePlain target:self.navigationItem.leftBarButtonItem action:nil];
    
    self.navigationItem.leftBarButtonItem = LeftButton;
    
    // Configure nav right button
    UIBarButtonItem *RightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contactlist.png"] style:UIBarButtonItemStylePlain target:self.navigationItem.rightBarButtonItem action:nil];

     self.navigationItem.rightBarButtonItem = RightButton;
    


    
    //spin animation for first 5 second
    [self.spinicon startAnimating];

    
    dispatch_queue_t downloadQueue = dispatch_queue_create("downloader", NULL);
    
    
       dispatch_async(downloadQueue, ^{
            [NSThread sleepForTimeInterval:5.0];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.spinicon stopAnimating];
                
                UIImageView *facebookfeed = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"feedview.png"]];
                [facebookfeed setUserInteractionEnabled:YES];
                [self.UIFeedView addSubview:facebookfeed];
                [self.UIFeedView setContentSize:facebookfeed.frame.size];
                
            });
        });
    

    
}

- (void)onLeftButton
{
    [super didReceiveMemoryWarning];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onRightButton
{
    [super didReceiveMemoryWarning];
    [self dismissViewControllerAnimated:YES completion:nil];
}


 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
