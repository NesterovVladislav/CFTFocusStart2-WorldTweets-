//
//  AppDelegate.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "AppDelegate.h"
#import "AppController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate
{
    AppController *appController;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    appController = [[AppController alloc] initWithConfigName:@"config.plist" ];
    
    return YES;
}

@end
