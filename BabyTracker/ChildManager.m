//
//  ChildManager.m
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "ChildManager.h"
#import "Child.h"
#import "Sleep.h"
#import "Stroll.h"

@implementation ChildManager

+ (instancetype)sharedInstance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}

#pragma mark -

- (void)addChild:(Child *)child {
    [_childs addObject:child];
    [self saveData];
}

#pragma mark - Childs

- (void)loadData {
    _childs = [NSMutableArray new];
    NSArray *list = [NSArray arrayWithContentsOfFile:self.path];
    for (NSDictionary *dict in list) {
        [_childs addObject:[[Child alloc] initWithDictionary:dict]];
    }
    }

- (void)saveData {
    NSMutableArray *array = [NSMutableArray new];
    for (Child* child in _childs){
        [array addObject:child.dictionary];
    }
    BOOL result = [array writeToFile:self.path atomically:YES];
    NSLog(@"%@", @(result) ? @"Saved" : @"Not saved");
    
}

- (NSString *)path {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    _path = [NSString stringWithFormat:@"%@/childs.plist",paths.firstObject];
    return _path;
}

#pragma mark - Sleep

- (void)loadSleep {
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"Current Sleep"];
    if (dict) {
        _sleep = [[Sleep alloc] initWithDictionary:dict];
    }
}

- (void)saveSleep {
    [[NSUserDefaults standardUserDefaults] setObject:_sleep.dictionary forKey:@"Current Sleep"];
}

- (void)removeSleep {
    _sleep = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Current Sleep"];
}

#pragma mark - Stroll

- (void)loadStroll {
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"Current Stroll"];
    if (dict) {
        _stroll = [[Stroll alloc] initWithDictionary:dict];
    }
}

- (void)saveStroll {
    [[NSUserDefaults standardUserDefaults] setObject:_stroll.dictionary forKey:@"Current Stroll"];
}

- (void)removeStroll {
    _stroll = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Current Stroll"];
}

#pragma mark - Dealloc

- (void)dealloc {
    [self saveData];
}

@end
