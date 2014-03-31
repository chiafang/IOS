//
//  MainViewController.m
//  Exerices3
//
//  Created by Alice Tsai on 3/26/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
- (IBAction)hit_btn:(UIButton *)sender;

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

- (IBAction)hit_btn:(UIButton *)sender {
    CGRect bluebaby = CGRectMake(self.blueView.frame.origin.x + 100,self.blueView.frame.origin.y, self.blueView.frame.size.width, self.blueView.frame.size.height);
    
    
    [UIView animateWithDuration:2 animations:^{
        //
        self.blueView.frame =bluebaby;
        
        
        
    } completion:^(BOOL finished) {
        //
    }];
}
@end
