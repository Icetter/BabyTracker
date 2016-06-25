//
//  AppDelegate.m
//  BabyTracker
//
//  Created by Iceman on 12.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "AppDelegate.h"
#import "MainScreenViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[MainScreenViewController new]];
    [_window makeKeyAndVisible];
    return YES;
}

@end
