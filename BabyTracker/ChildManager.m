//
//  ChildManager.m
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "ChildManager.h"
#import "Child.h"

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

#pragma mark - 

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
    NSLog(@"%@", @(result));
}

- (NSString *)path {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *path = [NSString stringWithFormat:@"%@/childs.plist",paths.firstObject];
    return path;
}

#pragma mark - 

- (void)dealloc {
    [self saveData];
}

@end
