//
//  Entities.m
//  control
//
//  Created by Nesterov on 17/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "Entities.h"

@interface Entities()

@property (nonatomic, strong, readwrite) Media *media;
@property (nonatomic, strong, readwrite) Urls *urls;

@end

@implementation Entities
{
}
- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"media: %@\nurls: %@", @"media", @"urls"];
    
}

+ (NSArray<PropertyInfo *> *)deserializeableProperties
{
    return @[
             [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(media)) className:[Media class]],
             [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(urls)) className:[Urls class]]
             ];
}

@end
