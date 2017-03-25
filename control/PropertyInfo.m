//
//  PropertyInfo.m
//  control
//
//  Created by Student on 15.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "PropertyInfo.h"

@implementation PropertyInfo
{
}
- (instancetype)initWithMethod:(NSString *)method className:(Class)className
{
    assert(nil != method);
    assert(NO == [method isEqualToString:@""]);
    
    self = [super init];
    
    _method = [method copy];
    _class = className;
    
    return self;
}

- (instancetype)init
{
    assert(NO);
    return nil;
}

@end
