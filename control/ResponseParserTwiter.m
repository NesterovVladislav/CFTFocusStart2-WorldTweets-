//
//  ResponseParserTwiter.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "ResponseParserTwiter.h"
#import "ResponseParserDictionary.h"
#import "Deserializeable.h"
#import "User.h"


@implementation ResponseParserTwiter
{
    ResponseParserDictionary *parserDictionary;
}
- (instancetype)init
{
    self = [super init];
    
    parserDictionary = [[ResponseParserDictionary alloc] init];
    
    return self;
}

- (id)parserResponse:(id)json expected:(Class)class
{
    id result = [[class alloc] init];
    
    if( NO == [result conformsToProtocol:@protocol(Deserializeable)] )
    {
        assert(NO);
        return nil;
    }
    
    NSArray<PropertyInfo *> *properties = [class deserializeableProperties];
    
    if( [json isKindOfClass:[NSArray class]] )
    {
        result = [[NSMutableArray alloc]  init];
       
        [json enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
        {
            id resultWoon = [[class alloc] init];
            
            [properties enumerateObjectsUsingBlock:^(PropertyInfo * _Nonnull objProperti, NSUInteger idxProperti, BOOL * _Nonnull stop)
            {
                NSString *propertyKey = objProperti.method;
                id value = json[idx][propertyKey];
                if( value != nil )
                {
                    if( [value isKindOfClass:[NSDictionary class]] )
                    {
                        id nextValue = [parserDictionary parserResponse:value expected:objProperti.class];
                        value = nextValue;
                    }
                    [resultWoon setValue:value forKey:propertyKey ];
                }
            }];
            
            [result addObject:resultWoon];
        }];
    }
    
    return [result copy];
}

@end
