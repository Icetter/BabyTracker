//
//  ChildManager.h
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Child;
@interface ChildManager : NSObject

@property (strong, nonatomic) NSMutableArray *childs;
@property (strong, nonatomic) Child *child;
@property NSString* path;

+ (instancetype)sharedInstance;

- (void)addChild:(Child *)child;

@end
