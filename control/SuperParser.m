//
//  SuperParser.m
//  control
//
//  Created by Nesterov on 17/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "SuperParser.h"

@implementation SuperParser
{
    NSDictionary * parsers;
}
- (instancetype)init
{
    self = [ super init ];
    
    if( self )
    {
        parsers = [NSDictionary dictionaryWithObjectsAndKeys:[[ResponseParserTwiter alloc] init], @"ResultTypeTwiter",  [[ResponseParserAvtorization alloc] init], @"ResultTypeAvtorization", [[ResponseParserDictionary alloc] init], @"ResultTypeDictionary",nil	];
    
    }
    return self;
}
-(id<Parser>)objectForKey:(ResultType)key
{
    switch( key )
    {
        case ResultTypeAvtorization:
             return [parsers objectForKey:@"ResultTypeAvtorization"];
            break;
        case ResultTypeTwiter:
            return [parsers objectForKey:@"ResultTypeTwiter"];
            break;
        case ResultTypeDictionary:
            return [parsers objectForKey:@"ResultTypeDictionary"];
        default:
            assert(NO);
            break;
    }
}
@end
