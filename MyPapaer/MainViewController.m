//
//  MainViewController.m
//  MyPapaer
//
//  Created by Alice Tsai on 3/28/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *UIViewMenu;
@property (weak, nonatomic) IBOutlet UIView *UIViewNewsfeed;
- (IBAction)onPanscreen:(UIPanGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIView *view;

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

- (IBAction)onPanscreen:(UIPanGestureRecognizer *)sender {

    CGPoint Velocity = [sender velocityInView:self.view];
    CGPoint point = CGPointMake(self.UIViewNewsfeed.center.x, self.UIViewNewsfeed.center.y+Velocity.y);
    
    
    if(sender.state == UIGestureRecognizerStateBegan) {
        
    } else if(sender.state == UIGestureRecognizerStateChanged) {
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if(Velocity.y > 0 ) {
            CGRect frame = CGRectMake(0, self.view.frame.size.height - 40, self.UIViewNewsfeed.frame.size.width, self.UIViewNewsfeed.frame.size.height);
            
            [UIView animateWithDuration:3 animations:^{
                self.UIViewNewsfeed.frame = frame;
            }];
        } else if (Velocity.y < 0 ) {
            CGRect frame = CGRectMake(0, 0, self.UIViewNewsfeed.frame.size.width, self.UIViewNewsfeed.frame.size.height);
            [UIView animateWithDuration:3 animations:^{
                self.UIViewNewsfeed.frame = frame;
            }];
        }

    }
    /*

    if (Velocity.y > 0) {
        NSLog(@"scroll down");
        
        if(self.UIViewNewsfeed.frame.origin.y > self.view.frame.size.height - 40) {
            self.UIViewNewsfeed.center = point;
        }
    } else if (Velocity.y < 0) {
        NSLog(@"scroll up");
        
        if(self.UIViewNewsfeed.frame.origin.y > - 20) {
            self.UIViewNewsfeed.center = point;
        }
        
    }

    */
    
    
}
@end
