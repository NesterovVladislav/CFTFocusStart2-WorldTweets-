//
//  Media.m
//  control
//
//  Created by Nesterov on 17/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "Media.h"

@interface Media()

@property ( nonatomic, copy, readwrite ) NSString *media_url_https;

@end

@implementation Media
{
}
- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"media_url_https: %@", _media_url_https];
    
}

+ (NSArray<PropertyInfo *> *)deserializeableProperties
{
    return @[
             [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(media_url_https))className:[NSString class]]
             ];
}
@end
