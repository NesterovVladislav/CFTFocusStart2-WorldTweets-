//
//  Header.m
//  control
//
//  Created by Nesterov on 03/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "Header.h"

@implementation Header
{
    NSMutableDictionary *header;
}
- (instancetype)init
{
    self = [super init];
    
    header = [[NSMutableDictionary alloc] init];
    
    return self;
}

- (void)addValueForkey:(NSString *)object forKey:(NSString *)key
{
    assert(nil != object);
    assert(nil != key);
    assert(NO == [key isEqualToString:@""]);
    assert(NO == [object isEqualToString:@""]);

    [header setObject:object forKey:key];
}

- (void)enumerateKeysAndObjectsUsingBlock:(void(^)( NSString * obj, NSString * key))enumerate
{
    [header enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop)
    {
        enumerate(obj, key);
    }];
}

@end
