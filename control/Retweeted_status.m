//
//  Retweeted_status.m
//  control
//
//  Created by Nesterov on 16/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "Retweeted_status.h"

@interface RetweetedStatus()

@property (nonatomic, strong, readwrite) User *user;
@property (nonatomic, strong, readwrite) Entities *entities;
@property (nonatomic, copy, readwrite) NSString *text;

@end

@implementation RetweetedStatus
{
}
- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"user %@\ntext %@nentities %@",@"user", _text, @"entities"];
}

+ (NSArray<PropertyInfo *> *)deserializeableProperties
{
    return @[
             [[PropertyInfo alloc]initWithMethod:  NSStringFromSelector(@selector(user)) className:[User class]],
             [[PropertyInfo alloc]initWithMethod:  NSStringFromSelector(@selector(text)) className:[NSString class]],
             [[PropertyInfo alloc]initWithMethod:  NSStringFromSelector(@selector(entities)) className:[Entities class]]
             ];
}

@end
