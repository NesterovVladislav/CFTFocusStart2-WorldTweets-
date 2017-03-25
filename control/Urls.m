//
//  Urls.m
//  control
//
//  Created by Nesterov on 24/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "Urls.h"

@interface Urls()

@property (nonatomic, copy, readwrite) NSString *display_url;
@property (nonatomic, copy, readwrite) NSString *url;
@property (nonatomic, copy, readwrite) NSString *expanded_url;

@end

@implementation Urls
{
}
- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"display_url: %@\nurl: %@\nexpanded_url: %@", _display_url, _url, _expanded_url];
    
}

+ (NSArray<PropertyInfo *> *)deserializeableProperties
{
    return @[
             [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(display_url))className:[NSString class]],
             [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(url)) className:[NSString class]],
             [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(expanded_url))className:[NSString class]]
             ];
}

@end
