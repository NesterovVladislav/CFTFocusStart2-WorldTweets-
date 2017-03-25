//
//  SuperError.m
//  control
//
//  Created by Nesterov on 17/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "SuperError.h"


@interface SuperError()

@property (nonatomic, copy, readwrite) NSString *error;
@property (nonatomic, strong, readwrite) ErrorForParsingJSON * errors;

@end

@implementation SuperError
{
}
- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"error: %@\nerrors: %@", _error, @"errors"];
}

+ (NSArray<PropertyInfo *> *)deserializeableProperties
{
    return @[
             [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(error)) className:[NSString class]],
             [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(errors)) className:[ErrorForParsingJSON class]]
             ];
}

- (NSError *)convertToNSError
{
    if( nil != _error )
    {
        return  [NSError errorWithDomain:_error code:401 userInfo:nil];
    }
    else if( nil != _errors )
    {
        return  [NSError errorWithDomain:_errors.message code:_errors.code userInfo:nil];
    }
    else
    {
        return nil;
    }
}

@end
