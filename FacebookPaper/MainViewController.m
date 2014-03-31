//
//  MainViewController.m
//  FacebookPaper
//
//  Created by Alice Tsai on 3/28/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UIView *facebookFeedUIView;
@property (weak, nonatomic) IBOutlet UIView *myProfileView;
@property (weak, nonatomic) IBOutlet UIScrollView *feedstreamscroll;
@property (weak, nonatomic) IBOutlet UIImageView *feedstreamcontent;



@end

@implementation MainViewController

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
    
    
    [self.myProfileView addSubview:self.facebookFeedUIView.view];
    
    [self.facebookFeedUIView bringSubviewToFront:self.myProfileView.view];


    
    
    UIImageView *feedstreamcontent = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"feedstream.png"]];
    [feedstreamcontent setUserInteractionEnabled:YES];
    [self.feedstreamscroll addSubview:feedstreamcontent];
 [self.feedstreamscroll setContentSize:feedstreamcontent.frame.size];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
