//
//  RequestContext.m
//  Animation
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//
#import "RequestContext.h"

@implementation RequestContext
{
}
- (instancetype)initWithParametrs:(NSString *)url method:(NSString *)method header:(Header *)headerRequest httpBody:(NSData *)httpBody expectedClass:(Class)class typeResult:(ResultType)type
{
    assert(nil != url);
    assert(nil != method);
    assert(nil != headerRequest);
    assert(NO == [url isEqualToString:@""]);
    assert(NO == [method isEqualToString:@""]);
    
    self = [super init];
    
    _url = [url copy];
    _httpMethod = [method copy];
    _headerRequest = headerRequest;
    _httpBody = httpBody;
    _expectedClass = class;
    _typeResult = type;
    
    return self;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
