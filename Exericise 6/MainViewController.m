//
//  MainViewController.m
//  Exericise 6
//
//  Created by Alice Tsai on 3/27/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
- (IBAction)onTapAction:(UITapGestureRecognizer *)sender;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapAction:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.mainView];

    
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.blueView.center = point;

    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            CGAffineTransform transform = CGAffineTransformMakeRotation(M_2_PI *45/360);
            self.blueView.transform = transform;
        } completion:^(BOOL finished) {
            self.blueView.backgroundColor = [UIColor redColor];
            
        }];

    }];
    
}
@end
