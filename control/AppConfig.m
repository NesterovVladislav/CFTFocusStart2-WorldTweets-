//
//  AppConfig.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "AppConfig.h"

@implementation AppConfig
{
}
- (instancetype)initWithConfigName:(NSString *)configName
{
    assert(nil != configName);
    assert(NO == [configName isEqualToString:@""]);
    
    self = [super init];
    
    [self loadConfig:configName];
    
    return self;
}

- (void)loadConfig:(NSString *)configName
{
    NSString *localConfigPath = [[NSBundle mainBundle] pathForResource:configName.stringByDeletingPathExtension
                                                                ofType:configName.pathExtension];
    
    NSDictionary *contents = [NSDictionary dictionaryWithContentsOfFile:localConfigPath];
    
    assert(nil != contents);
    
    _apiKey = contents[NSStringFromSelector(@selector(apiKey))] ;
    _apiSecret = contents[NSStringFromSelector(@selector(apiSecret))];

}

- (instancetype)init
{
    assert(NO);
    return nil;
}

@end
