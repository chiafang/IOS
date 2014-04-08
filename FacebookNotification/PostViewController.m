//
//  PostViewController.m
//  FacebookNotification
//
//  Created by Alice Tsai on 4/3/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()
@property (weak, nonatomic) IBOutlet UIView *postView;
@property (weak, nonatomic) IBOutlet UIScrollView *postScrollView;

@end

@implementation PostViewController

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
    CGRect frame = CGRectMake(self.postView.frame.origin.y, self.postView.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    self.postView.frame = frame;
   // [self.postView setUserInteractionEnabled:YES];
    self.postView.userInteractionEnabled = NO;
   // [self.postView addSubview:self.postScrollView];
    [self.postScrollView setContentSize:self.postView.frame.size];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
