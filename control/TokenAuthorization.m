//
//  Avtorization.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "TokenAuthorization.h"

@interface TokenAuthorization()

@property (nonatomic, copy, readwrite) NSString *token_type;
@property (nonatomic, copy, readwrite) NSString *access_token;

@end

@implementation TokenAuthorization
{
}
- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"token_type: %@\naccess_token: %@",  _token_type, _access_token];
}

+ (NSArray<PropertyInfo *> *)deserializeableProperties
{
    return @[
            [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(token_type)) className:[NSString class]],
            [[PropertyInfo alloc]initWithMethod:NSStringFromSelector(@selector(access_token)) className:[NSString class]]
            ];
}

@end

