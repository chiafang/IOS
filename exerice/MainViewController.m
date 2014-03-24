//
//  MainViewController.m
//  exerice
//
//  Created by Alice Tsai on 3/18/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Result;
- (IBAction)minus_buttom:(id)sender;
- (IBAction)plus_buttom:(id)sender;
@property (nonatomic, assign) int number;



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
    
    self.number= 9;
    
    self.Result.text = [NSString stringWithFormat:@"%d", self.number];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)minus_buttom:(id)sender {
    int temp = [self.Result.text intValue];
    temp = temp +1;
    //self.number= [self.Result.text intValue];
    self.number= self.number -1;
    self.Result.text= [NSString stringWithFormat:@"%d", self.number];
    
}

- (IBAction)plus_buttom:(id)sender {
    //self.number= [self.Result.text intValue];
    self.number= self.number +1;
    self.Result.text= [NSString stringWithFormat:@"%d", self.number];
}
@end
