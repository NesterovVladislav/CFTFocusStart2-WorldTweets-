//
//  ResponseParserAvtorization.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "ResponseParserAvtorization.h"
#import "ResponseParserDictionary.h"
#import "Deserializeable.h"


@implementation ResponseParserAvtorization
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
    return [parserDictionary parserResponse:json expected:class];
}

@end
