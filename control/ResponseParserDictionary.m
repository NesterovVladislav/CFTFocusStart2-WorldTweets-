//
//  ResponseParser.m
//  Animation
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "ResponseParserDictionary.h"
#import "Deserializeable.h"

@implementation ResponseParserDictionary
{
}
- (instancetype)init
{
    self = [super init];
    return self;
}

- (id)parserResponse:(id)json expected:(Class)class
{
    if( NO == [json isKindOfClass:[NSDictionary class]] )
    {
        return nil;
    }
    
    id result = [[class alloc] init];
    
    if( NO == [result conformsToProtocol:@protocol(Deserializeable)] )
    {
        assert(NO);
        return nil;
    }
    
    NSArray<PropertyInfo *> *properties = [class deserializeableProperties];
    
    [properties enumerateObjectsUsingBlock:^(PropertyInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        NSString *propertyKey = obj.method;
        id value = json[propertyKey];
        if( value != nil )
        {
            if( [value isKindOfClass:[NSArray class]] )
            {
                value = [value firstObject];
            }
            
            if( [value isKindOfClass:[NSDictionary class]] )
            {
                id nextValue = [self parserResponse:value expected:obj.class];
                value = nextValue;
            }
            
            [result setValue:value forKey:propertyKey];
        }
    }];

    return result;
}

@end
