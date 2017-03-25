//
//  NSArray+seachMinID.m
//  control
//
//  Created by Student on 20.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "NSArray+seachMinID.h"

@implementation NSArray (SeachMinID)

+ (NSInteger)seachMinIDInArrayTweet:(NSArray<Tweet *> *) arrayTwiters
{
    assert(nil != arrayTwiters);

    __block NSInteger min = [arrayTwiters firstObject].id;
    
    [arrayTwiters enumerateObjectsUsingBlock:^(Tweet * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        if( min > obj.id )
        {
            min = obj.id;
        }
    }];
    
    return min;
}

@end
