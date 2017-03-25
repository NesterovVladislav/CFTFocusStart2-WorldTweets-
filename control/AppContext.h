//
//  AppContext.h
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppConfig;

@interface AppContext : NSObject

@property (nonatomic, strong, readonly) AppConfig *config;

- (instancetype)initWithConfigName:(NSString *)configName;

- (NSString *)getAPIKey;
- (NSString *)getAPIsecret;

- (instancetype)init NS_UNAVAILABLE;

@end

