//
//  AppContext.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "AppContext.h"
#import "AppConfig.h"

@implementation AppContext
{
}
- (instancetype)initWithConfigName:(NSString *)configName
{
    assert(nil != configName);
    assert(NO == [configName isEqualToString:@""]);
    
    self = [super init];
    
    _config = [[AppConfig alloc] initWithConfigName:configName];
    
    return self;
}

- (NSString *)getAPIKey
{
    return _config.apiKey;
}

- (NSString *)getAPIsecret
{
    return _config.apiSecret;
}

- (instancetype)init
{
    assert(NO);
    return nil;
}

@end
