//
//  ChildManager.h
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Child, Sleep;
@interface ChildManager : NSObject

@property (strong, nonatomic) NSMutableArray *childs;
@property (strong, nonatomic) Child *child;
@property (strong, nonatomic) Sleep *sleep;
@property (strong, nonatomic) NSString* path;

+ (instancetype)sharedInstance;
- (void)saveData;

- (void)addChild:(Child *)child;
- (void)saveSleep;
- (void)loadSleep;
- (void)removeSleep;

@end
