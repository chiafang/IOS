//
//  MainViewController.m
//  paper
//
//  Created by Youngchae Kim on 3/28/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *MenuView;
@property (weak, nonatomic) IBOutlet UIView *NewsView;
@property (weak, nonatomic) IBOutlet UIScrollView *NewsScollView;
@property CGPoint startPoint;
- (IBAction)onPan:(UIPanGestureRecognizer *)sender;

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
    UIImage * image = [UIImage imageNamed:@"news.png"];
    CGSize sacleSize = CGSizeMake(image.size.width/2, 250);
    UIGraphicsBeginImageContextWithOptions(sacleSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, sacleSize.width, sacleSize.height)];
    UIImage * resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
    UIImageView *news = [[UIImageView alloc]initWithImage:resizedImage];
    [news setUserInteractionEnabled:YES];
    [self.NewsScollView addSubview:news];
    [self.NewsScollView setContentSize:news.frame.size];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];


}
- (IBAction)onPan:(UIPanGestureRecognizer *)sender {

    // 1. When user begin to touch the screen, we get the original center point
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.startPoint = self.NewsView.center;
    }
    
    
    // 2. When user changed, we will calculate the translate distance and replace the new target to start point
    else if (sender.state ==UIGestureRecognizerStateChanged) {
        CGPoint translate = [sender translationInView:self.view];
        CGPoint target = CGPointMake(self.NewsView.center.x, self.startPoint.y + translate.y);
        self.NewsView.center = target;
    }
    // 3. When user end the screen, the target screen could go back the start point or in the end of button depending on the valocity
    else if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [sender velocityInView:self.view];
        if (velocity.y < 0 ) {
            CGRect target = CGRectMake(0,0,self.NewsView.frame.size.width, self.NewsView.frame.size.height);

            [UIView animateWithDuration:0.6 animations:^{
                self.NewsView.frame = target;

            }];
        

        }
        if (velocity.y > 0 ) {
        CGRect target = CGRectMake(0,self.NewsView.frame.size.height - 40 ,self.NewsView.frame.size.width, self.NewsView.frame.size.height);
            [UIView animateWithDuration:0.6 animations:^{
                self.NewsView.frame = target;
            }];
            
        }
        
    }
    
    
    
    
    
}

/*
- (IBAction)onPan:(UIPanGestureRecognizer *)sender {

    CGPoint velocity = [sender velocityInView:self.view];

    // 1. get point when an use touch in view - state is begin
    if ( sender.state == UIGestureRecognizerStateBegan) {
        self.startPoint = self.NewsView.center;
    }
    // 2. I want to move new view  following my finger change and as same distand as my finger move
    //    get translation point / calculate target center / replace view original center to target center in state = change ,
    else if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint translate = [sender translationInView:self.view];
        CGPoint target = CGPointMake(self.NewsView.center.x, self.startPoint.y + translate.y);
        self.NewsView.center = target;
    }
    // 3. in figure untouch - in end state
    //      move top : replace view center to original center
    //      move bottom : calculate target center / replace view center to target
    //      as slide up / down, I want to move view to top or bottom
    else if( sender.state == UIGestureRecognizerStateEnded) {
    
        if(velocity.y < 0) {
            CGRect target = CGRectMake(0, 0, self.NewsView.frame.size.width, self.NewsView.frame.size.height);
            self.NewsView.frame = target;
        } else if (velocity.y > 0) {
            CGRect target = CGRectMake(0, self.view.frame.size.height - 40, self.NewsView.frame.size.width, self.NewsView.frame.size.height);
            self.NewsView.frame   = target;
        }
        
    }
    
    
}
*/
/*

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    
    //  CGPoint point = [sender locationInView:self.view];
    CGPoint velocity = [sender velocityInView:self.view];
    CGPoint translation = [sender translationInView:self.view];
    
    NSLog(@"translation x : %f, y : %f", translation.x, translation.y);
    
    //  NSLog(@"point x : %f, y : %f", point.x, point.y);
    //  NSLog(@"velocity x : %f, y : %f", velocity.x, velocity.y);
    //  NSLog(@"view  x : %f, y : %f", self.view.frame.size.width, self.view.frame.size.height);
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.startPoint = self.NewsView.center;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        CGPoint center = CGPointMake(self.NewsView.center.x, self.startPoint.y + translation.y);
        
        if(velocity.y < 0) {
            if(self.NewsView.frame.origin.y > -15 ) {
                self.NewsView.center = center;
            }
            
        } else {
            self.NewsView.center = center;
        }
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        
        if (velocity.y < 0) {
            CGRect frame = CGRectMake(0, 0, self.NewsView.frame.size.width, self.NewsView.frame.size.height);
            
            [UIView animateWithDuration:0.6 animations:^{
                self.NewsView.frame = frame;
            }];
        } else {
            CGRect frame = CGRectMake(0, self.view.frame.size.height - 40, self.NewsView.frame.size.width, self.NewsView.frame.size.height);
            [UIView animateWithDuration:0.6 animations:^{
                self.NewsView.frame = frame;
            }];
        }
        
    }
    
}
*/
@end
