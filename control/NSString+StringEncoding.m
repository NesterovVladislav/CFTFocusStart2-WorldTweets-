//
//  NSString+StringEncoding.m
//  control
//
//  Created by Student on 20.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "NSString+StringEncoding.h"

@implementation NSString (StringEncoding)

- (nullable NSString *)stringEncodingUrl
{
    NSString *unreserved = @"-._~/?";
    
    NSMutableCharacterSet *allowed = [NSMutableCharacterSet
                                      alphanumericCharacterSet];
    [allowed addCharactersInString:unreserved];
    
    return [self
            stringByAddingPercentEncodingWithAllowedCharacters:
            allowed];
}

@end
