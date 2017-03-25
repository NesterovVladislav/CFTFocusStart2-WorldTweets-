//
//  AppController.h
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AppContext;

@interface AppController : NSObject

@property (nonatomic, strong, readonly) AppContext *appContext;

- (instancetype)initWithConfigName:(NSString *)configName;

- (instancetype)init NS_UNAVAILABLE;

@end
