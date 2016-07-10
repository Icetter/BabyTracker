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
@property (strong, nonatomic) IBOutlet UILabel *timeLapsedLabel;
@property (strong, nonatomic) IBOutlet UILabel *foodQuantityLabel;
@property (strong, nonatomic) IBOutlet UITextField *foodQuantityTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *foodPicker;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* foodArray = [NSArray arrayWithObjects:@"Left breast", @"Right breast", @"Racking", @"Infant formula", @"Milk porridge", @"Dairy-free porridge", @"Vegetable puree", @"Fruit puree", @"Meat puree", @"Fish puree", @"Juice", @"Water", @"Biscuit", nil];
    
    
    
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
