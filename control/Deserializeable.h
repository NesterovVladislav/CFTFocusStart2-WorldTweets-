//
//  Deserializeable.h
//  Animation
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PropertyInfo.h"

@protocol Deserializeable <NSObject>

+ (NSArray<PropertyInfo *> *)deserializeableProperties;

@end
