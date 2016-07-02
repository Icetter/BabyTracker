//
//  AppDelegate.m
//  BabyTracker
//
//  Created by Iceman on 12.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "AppDelegate.h"
#import "MainScreenViewController.h"
#import "ChildManager.h"
#import "Child.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    Child *child1 = [Child new];
//    child1.name = @"Bob";
//    child1.age = 22;
//    [[ChildManager sharedInstance] addChild:child1];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"Ivan" forKey:@"CurrentName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[MainScreenViewController new]];
    [_window makeKeyAndVisible];
    return YES;
}

@end
