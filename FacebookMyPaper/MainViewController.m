//
//  MainViewController.m
//  FacebookMyPaper
//
//  Created by Alice Tsai on 3/28/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *UIViewMainFeed;
- (IBAction)onPanNewshorizontal:(UIPanGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *feedstream;
@property (weak, nonatomic) IBOutlet UIScrollView *feedscrollstream;
- (IBAction)onCustomTap:(id)sender;
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
    
  //  UIImage *image = [UIImage imageNamed:@"news.png"];
   // [self.feedstream setImage:image];
   // [self.feedscrollstream setContentSize:image.size];
    
    UIImageView *news = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"news.png"]];
    [news setUserInteractionEnabled:YES];
    [self.feedscrollstream addSubview:news];
    [self.feedscrollstream setContentSize:news.frame.size];

    

     UIScreenEdgePanGestureRecognizer *tapGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(onCustomTap:)];
    
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
}

- (IBAction)onCustomTap :(UIScreenEdgePanGestureRecognizer*)sender {
    NSLog(@"panright");
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPanNewshorizontal:(UIPanGestureRecognizer *)sender {
  
    NSLog(@"panright");
    CGPoint point = [sender locationInView:self.UIViewMainFeed];
    CGPoint fixedpoint = CGPointMake(point.x, self.feedscrollstream.center.y );
    self.feedscrollstream. = fixedpoint;
    
   
}
@end
