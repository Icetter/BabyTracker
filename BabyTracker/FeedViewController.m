//
//  FeedViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "FeedViewController.h"
#import "ListViewController.h"
#import "TimerViewController.h"

@interface FeedViewController ()
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *quantityOfFoodLabel;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)addFoodActionButton:(id)sender {
}

- (IBAction)feedTimerActionButton:(id)sender {
    [self.navigationController pushViewController:[TimerViewController new] animated:YES];
}

- (IBAction)feedListActionButton:(id)sender {
    [self.navigationController pushViewController:[ListViewController new] animated:YES];
}
@end
