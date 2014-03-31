//
//  MainViewController2.m
//  Exerices3
//
//  Created by Alice Tsai on 3/26/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController2.h"

@interface MainViewController2 ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIButton *Hitbutton;
- (IBAction)hitClickbtn:(UIButton *)sender;
- (IBAction)onPan:(UIPanGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIView *yellow;

@end

@implementation MainViewController2

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

- (IBAction)hitClickbtn:(UIButton *)sender {
    float targetx= self.view.frame.size.width -  self.blueView.frame.size.width *2 -25 ;
    
    CGRect bluebaby = CGRectMake(targetx,self.blueView.frame.origin.y, self.blueView.frame.size.width *2, self.blueView.frame.size.height *2);
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_2_PI *15/360);
    
    [UIView animateWithDuration:2 animations:^{
        
        self.blueView.frame =bluebaby;
        self.blueView.backgroundColor=[UIColor orangeColor];
        self.blueView.transform= transform;
        self.blueView.alpha=0.5;
        
    } completion:^(BOOL finished) {
     
        UIAlertView *alertview = [[UIAlertView alloc]initWithTitle: @"done" message:@"You are pig! Not to be sad!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        
        [alertview show];
        
    }];
CGPoint Volacity
     
}

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    
    CGPoint point = [sender locationInView:self.view];
    NSLog(@"hello!");
    self.blueView.center = point;
    
    if(sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"begin!");
    } else     if(sender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"changed!");
    } else     if(sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"end!");
        
        CGPoint point2 = CGPointMake(0,0);
        self.blueView.center = point2;

    }

}

@end
