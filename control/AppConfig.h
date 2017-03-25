//
//  AppConfig.h
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConfig : NSObject

@property (nonatomic, copy, readonly) NSString *apiKey;
@property (nonatomic, copy, readonly) NSString *apiSecret;


- (instancetype)initWithConfigName:(NSString *)configName;

- (instancetype)init NS_UNAVAILABLE;

@end
