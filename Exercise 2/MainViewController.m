//
//  MainViewController.m
//  Exercise 2
//
//  Created by Alice Tsai on 3/19/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *move;
@property (weak, nonatomic) IBOutlet UIView *topview;
- (IBAction)onButtonLeftup:(id)sender;
- (IBAction)onButtonLeftdown:(id)sender;
- (IBAction)onButtonRightup:(id)sender;
- (IBAction)onButtonRightdown:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *righttopbutton;

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

- (IBAction)onButtonLeftup:(id)sender {
    CGRect rect_information = self.move.frame;
    rect_information.origin.y =  0;
    rect_information.origin.x =  0;
   [UIView animateWithDuration:2 animations:^{
       self.move.frame=rect_information;
    }
    ];
    
}
  
- (IBAction)onButtonLeftdown:(id)sender {
    

    CGRect rect_information = self.move.frame;
    rect_information.origin.x = 0;
    rect_information.origin.y = self.topview.frame.size.height - rect_information.size.height ;
    [UIView animateWithDuration:2 animations:^{
        self.move.frame=rect_information;

       }
        ];
}
        

- (IBAction)onButtonRightup:(id)sender {
    CGRect frame = self.move.frame;
    frame.origin.y = 0;
    frame.origin.x = self.topview.frame.size.width - frame.size.width;
    
    [UIView animateWithDuration:2 animations:^{
        self.move.frame=frame;
    }
     ];
}

- (IBAction)onButtonRightdown:(id)sender {
    CGRect rect_information = self.move.frame;
    rect_information.origin.x = self.topview.frame.size.width - rect_information.size.width;
    rect_information.origin.y = self.topview.frame.size.height - rect_information.size.height   ;
    [UIView animateWithDuration:2 animations:^{
        self.move.frame=rect_information;
    }
     ];
}
     
     
@end
