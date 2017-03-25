//
//  AppController.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "AppController.h"
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "AppContext.h"

@implementation AppController
{
    UIWindow *window;
}
- (instancetype)initWithConfigName:(NSString *)configName
{
    assert(nil != configName);
    assert(NO == [configName isEqualToString:@""]);
    
    self = [super init];
    
    _appContext = [[AppContext alloc] initWithConfigName:configName];
    
    [self makeWindow];
    
    return self;
}

- (void)makeWindow
{
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *mainVC = [[ViewController alloc] initWithAppContext:_appContext];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    navigationController.navigationBar.translucent = NO;
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
}

- (instancetype) init
{
    assert(NO);
    return nil;
}

@end
