//
//  TBTabViewController.m
//  Tumblr
//
//  Created by Alice Tsai on 3/21/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "TBTabViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "EditViewController.h"
#import "AccountViewController.h"
#import "ActivityViewController.h"
#import "LoginViewController.h"


@interface TBTabViewController ()
@property (nonatomic, strong   ) HomeViewController  *homeview;
@property (nonatomic, strong   ) SearchViewController *searchview;
@property (nonatomic, strong   ) EditViewController *editview;
@property (nonatomic, strong   ) AccountViewController *accountview;
@property (nonatomic, strong   ) ActivityViewController *activityview;
@property (nonatomic, strong   ) LoginViewController *loginview;
@property (weak, nonatomic) IBOutlet UIView *ContentView;
@property (strong, nonatomic) IBOutlet UIImageView *popover;
- (IBAction)onBtnActivitiy:(UIButton *)sender;
- (IBAction)onBtnHome:(UIButton *)sender;
- (IBAction)onBtnSearch:(UIButton *)sender;
- (IBAction)onBtnAccount:(UIButton *)sender;

- (IBAction)onButtonEdit:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *HomeButton;
@property (weak, nonatomic) IBOutlet UIButton *SearchButton;
@property (weak, nonatomic) IBOutlet UIButton *ComposerButton;
@property (weak, nonatomic) IBOutlet UIButton *AccountButton;
@property (weak, nonatomic) IBOutlet UIButton *ActivityButton;
@property UIButton *currentSelectedButton;

@property (weak, nonatomic) IBOutlet UIView *TabUIView;


@end

@implementation TBTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.homeview= [[HomeViewController alloc] init ];
        self.searchview=[[SearchViewController alloc] init ];
        self.editview=[[EditViewController alloc]init ];
        self.accountview =[[AccountViewController alloc] init];
        self.activityview=[[ActivityViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    
    UIColor *myColor = [UIColor colorWithRed:(51.0 / 255.0) green:(66.0 / 255.0) blue:(86.0 / 255.0) alpha: 1];
    self.TabUIView.backgroundColor = myColor;
    
    
    [super viewDidLoad];
    self.homeview.view.frame = self.ContentView.frame;
    self.searchview.view.frame = self.ContentView.frame;
    self.editview.view.frame = self.ContentView.frame;
    self.accountview.view.frame = self.ContentView.frame;
    self.activityview.view.frame = self.ContentView.frame;
    // make all of view controller the same size as content view controller.

    [self.ContentView addSubview:self.homeview.view];
    [self.ContentView addSubview:self.searchview.view];
 //   [self.ContentView addSubview:self.editview.view];
    // dont need this because we will bring the modal cover over the view. 
    [self.ContentView addSubview:self.accountview.view];
    [self.ContentView addSubview:self.activityview.view];
    
    [self.ContentView bringSubviewToFront:self.homeview.view];
    
    [self.ContentView bringSubviewToFront:self.popover];
    CGPoint origin = self.popover.center;
    CGPoint target = CGPointMake(self.popover.center.x, self.popover.center.y+10);
    CABasicAnimation *bounce = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce.duration = 0.5;
    bounce.fromValue = [NSNumber numberWithInt:origin.y];
    bounce.toValue = [NSNumber numberWithInt:target.y];
    bounce.repeatCount = 2;
    bounce.autoreverses = YES;
    [self.popover.layer addAnimation:bounce forKey:@"position"];
    
    self.currentSelectedButton = self.HomeButton;
    self.currentSelectedButton.selected = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBtnActivitiy:(UIButton *)sender {
    
    [self.ContentView bringSubviewToFront:self.activityview.view];
    [self.ContentView bringSubviewToFront:self.popover];
    
    CGPoint origin = self.popover.center;
    CGPoint target = CGPointMake(self.popover.center.x, self.popover.center.y+10);
    CABasicAnimation *bounce = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce.duration = 0.5;
    bounce.fromValue = [NSNumber numberWithInt:origin.y];
    bounce.toValue = [NSNumber numberWithInt:target.y];
    bounce.repeatCount = 2;
    bounce.autoreverses = YES;
    [self.popover.layer addAnimation:bounce forKey:@"position"];
    
    self.currentSelectedButton.selected = NO;
    sender.selected = YES;
    self.currentSelectedButton = sender;
    
}

- (IBAction)onBtnHome:(UIButton *)sender {
    [self.ContentView bringSubviewToFront:self.homeview.view];

    
    [self.ContentView bringSubviewToFront:self.popover];
    
    CGPoint origin = self.popover.center;
    CGPoint target = CGPointMake(self.popover.center.x, self.popover.center.y+10);
    CABasicAnimation *bounce = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce.duration = 0.5;
    bounce.fromValue = [NSNumber numberWithInt:origin.y];
    bounce.toValue = [NSNumber numberWithInt:target.y];
    bounce.repeatCount = 2;
    bounce.autoreverses = YES;
    [self.popover.layer addAnimation:bounce forKey:@"position"];
    
    self.currentSelectedButton.selected = NO;
    sender.selected = YES;
    self.currentSelectedButton = sender;
}

- (IBAction)onBtnSearch:(UIButton *)sender {
    [self.ContentView bringSubviewToFront:self.searchview.view];
    
    self.currentSelectedButton.selected = NO;
    sender.selected = YES;
    self.currentSelectedButton = sender;
}

- (IBAction)onBtnAccount:(UIButton *)sender {
    [self.ContentView bringSubviewToFront:self.accountview.view];
    [self.ContentView bringSubviewToFront:self.popover];
    CGPoint origin = self.popover.center;
    
    CGPoint target = CGPointMake(self.popover.center.x, self.popover.center.y+10);
    CABasicAnimation *bounce = [CABasicAnimation animationWithKeyPath:@"position.y"];
    bounce.duration = 0.5;
    bounce.fromValue = [NSNumber numberWithInt:origin.y];
    bounce.toValue = [NSNumber numberWithInt:target.y];
    bounce.repeatCount = 2;
    bounce.autoreverses = YES;
    [self.popover.layer addAnimation:bounce forKey:@"position"];

    self.currentSelectedButton.selected = NO;
    sender.selected = YES;
    self.currentSelectedButton = sender;
}


- (IBAction)onButtonEdit:(id)sender {
    
    self.editview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:self.editview animated:YES completion:nil];
    //    [self.ContentView bringSubviewToFront:self.editview.view];
}



@end
