//
//  EnumerationKeyAndValue.h
//  control
//
//  Created by Nesterov on 14/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EnumerationKeyAndValue <NSObject>

- (void)enumerateKeysAndObjectsUsingBlock:(void(^)( NSString *obj, NSString *key))enumerate;

@end
