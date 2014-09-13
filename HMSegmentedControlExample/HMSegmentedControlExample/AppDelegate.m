//
//  AppDelegate.m
//  HMSegmentedControlExample
//
//  Created by Hesham Abd-Elmegid on 25/12/12.
//  Copyright (c) 2012 Hesham Abd-Elmegid. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "MyViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[MyViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
