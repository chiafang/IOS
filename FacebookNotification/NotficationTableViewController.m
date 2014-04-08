//
//  NotficationTableViewController.m
//  FacebookNotification
//
//  Created by Alice Tsai on 4/3/14.
//  Copyright (c) 2014 Alice Tsai. All rights reserved.
//

#import "NotficationTableViewController.h"
#import "NotifcationCellTableViewCell.h"
#import "PostViewController.h"
#import "UIImageView+AFNetworking.h"


@interface NotficationTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic, strong) NSArray *notifications;

- (IBAction)onTab:(UITapGestureRecognizer *)sender;

@end

@implementation NotficationTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.notifications =
        @[ @{ @"text" : @"1 Ben Langholz tagged you in a post in iOS Bootcamp for Designers",
              @"profile_url" : @"https://scontent-a-ord.xx.fbcdn.net/hprofile-prn2/l/t1.0-1/p50x50/1491606_10152029838488479_1757199530_t.jpg",
              @"timestamp" : @"Friday at 11:29 AM"
              },
           @{ @"text" : @"2 Ben Langholz tagged you in a post in iOS Bootcamp for Designers",
              @"profile_url" : @"https://scontent-a-ord.xx.fbcdn.net/hprofile-prn2/l/t1.0-1/p50x50/1491606_10152029838488479_1757199530_t.jpg",
              @"timestamp" : @"Friday at 11:29 AM"
              },
           @{ @"text" : @"3 Ben Langholz tagged you in a post in iOS Bootcamp for Designers",
              @"profile_url" : @"https://scontent-a-ord.xx.fbcdn.net/hprofile-prn2/l/t1.0-1/p50x50/1491606_10152029838488479_1757199530_t.jpg",
              @"timestamp" : @"Friday at 11:29 AM"
              },
           @{ @"text" : @"4 Ben Langholz tagged you in a post in iOS Bootcamp for Designers",
              @"profile_url" : @"https://scontent-a-ord.xx.fbcdn.net/hprofile-prn2/l/t1.0-1/p50x50/1491606_10152029838488479_1757199530_t.jpg",
              @"timestamp" : @"Friday at 11:29 AM"
              
              },
           @{ @"text" : @"4 Ben Langholz tagged you in a post in iOS Bootcamp for Designers",
              @"profile_url" : @"https://scontent-a-ord.xx.fbcdn.net/hprofile-prn2/l/t1.0-1/p50x50/1491606_10152029838488479_1757199530_t.jpg",
              @"timestamp" : @"Friday at 11:29 AM"
              
              }

           ];
    }
    return self;
}

- (void)viewDidLoad

{
    [super viewDidLoad];
    
    // configure navigation bar title and background color

    self.navigationItem.title = @"News Feed";
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"notification_title.png"]];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:73.0/255.0 green:105.0/255.0 blue:166.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    // Configure nav left button
    UIBarButtonItem *LeftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_button.png"] style:UIBarButtonItemStylePlain target:self.navigationItem.leftBarButtonItem action:nil];
    
    self.navigationItem.leftBarButtonItem = LeftButton;
    
    // Configure nav right button
    UIBarButtonItem *RightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contactlist.png"] style:UIBarButtonItemStylePlain target:self.navigationItem.rightBarButtonItem action:nil];
    
    self.navigationItem.rightBarButtonItem = RightButton;

    self.TableView.dataSource = self;
    self.TableView.rowHeight = 100;
    [self.TableView reloadData];
 
    UINib *nib = [UINib nibWithNibName:@"NotifcationCellTableViewCell" bundle:nil];
    [self.TableView registerNib:nib forCellReuseIdentifier:@"NotifcationCellTableViewCell"];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"current row: %d", self.notifications.count);

    return  self.notifications.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        NotifcationCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotifcationCellTableViewCell"];
    
        NSDictionary *notification = self.notifications[indexPath.row];

        NSURL *posterUrl = [NSURL URLWithString:notification[@"profile_url"]];
        [cell.feedimage setImageWithURL:posterUrl];
    
        cell.notoficationfeed.text = notification[@"text"];
        cell.feedtimestamp.text = notification[@"timestamp"];
    
    return cell;

  
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTab:(UITapGestureRecognizer *)sender {

    PostViewController *vc = [[PostViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    [self.parentViewController.navigationController pushViewController:vc animated:YES];
    NSLog(@"current row: 1");
}
@end
