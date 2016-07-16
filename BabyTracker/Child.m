//
//  Child.m
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "Child.h"
#import "Sleep.h"
#import "Feed.h"
#import "Stroll.h"
#import "Measures.h"

@implementation Child

- (NSDictionary *)dictionary {
    
    NSMutableArray *sleepsDict = [NSMutableArray new];
    for (Sleep *sleep in _sleeps) {
        [sleepsDict addObject:sleep.dictionary];
    }
    
    NSMutableArray *feedDict = [NSMutableArray new];
    for (Feed *feed in _feeds) {
        [feedDict addObject:feed.dictionary];
    }
    
    NSMutableArray *strollDict = [NSMutableArray new];
    for (Stroll *stroll in _strolls) {
        [strollDict addObject:stroll.dictionary];
    }
    
    NSMutableArray *measuresDict = [NSMutableArray new];
    for (Measures *measures in _measures) {
        [measuresDict addObject:measures.dictionary];
    }
    
    return @{
             @"Name" : _name,
             @"Age" : _birthDate,
             @"Creation Date" : _creationDate ? _creationDate : [NSDate date],
             @"Sleeps" : sleepsDict,
             @"Feeds" : feedDict,
             @"Strolls" : strollDict,
             @"Measures": measuresDict
             };
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    _name = dictionary[@"Name"];
    _birthDate = dictionary[@"Age"];
    _creationDate = dictionary[@"Creation Date"];
    
    NSArray *sleepList = dictionary[@"Sleeps"];
    NSMutableArray *sleeps = [NSMutableArray new];
    for (NSDictionary *dictSleep in sleepList) {
        [sleeps addObject:[[Sleep alloc] initWithDictionary:dictSleep]];
    }
    _sleeps = sleeps;
    
    NSArray *feedList = dictionary[@"Feeds"];
    NSMutableArray *feeds = [NSMutableArray new];
    for (NSDictionary *dictFeed in feedList) {
        [feeds addObject:[[Feed alloc] initWithDictionary:dictFeed]];
    }
    _feeds = feeds;
    
    NSArray *strollList = dictionary[@"Strolls"];
    NSMutableArray *strolls = [NSMutableArray new];
    for (NSDictionary *dictStroll in strollList) {
        [strolls addObject:[[Stroll alloc] initWithDictionary:dictStroll]];
    }
    _strolls = strolls;
    
    NSArray *measuresList = dictionary[@"Measures"];
    NSMutableArray *measures = [NSMutableArray new];
    for (NSDictionary *dictMeasures in measuresList) {
        [measures addObject:[[Measures alloc] initWithDictionary:dictMeasures]];
    }
    _measures = measures;
}

- (void)setSleeps:(NSMutableArray *)sleeps {
    _sleeps = sleeps;
}

@end
