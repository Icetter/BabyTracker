//
//  Child.m
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "Child.h"
#import "Sleep.h"

@implementation Child

- (NSDictionary *)dictionary {
    NSMutableArray *sleepsDict = [NSMutableArray new];
    for (Sleep *sleep in _sleeps) {
        [sleepsDict addObject:sleep.dictionary];
    }
    return @{
             @"Name" : _name,
             @"Age" : _age,
             @"Sleeps" : sleepsDict
             };
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    _name = dictionary[@"Name"];
    _age = dictionary[@"Age"];
    NSArray *list = dictionary[@"Sleeps"];
    NSMutableArray *sleeps = [NSMutableArray new];
    for (NSDictionary *dictSleep in list) {
        [sleeps addObject:[[Sleep alloc] initWithDictionary:dictSleep]];
    }
    _sleeps = sleeps;
}

@end
