//
//  ErrorForParsingJSON.m
//  control
//
//  Created by Student on 18.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "ErrorForParsingJSON.h"


@interface ErrorForParsingJSON()

@property (nonatomic, copy, readwrite) NSString *message;
@property (nonatomic, readwrite) NSInteger code;

@end

@implementation ErrorForParsingJSON
{
}
- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"message: %@\ncode: %ld", _message, _code];
}

+ (NSArray<PropertyInfo *> *)deserializeableProperties
{
    return @[
             [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(message)) className:[NSString class]],
             [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(code)) className:nil]
             ];
}

@end
