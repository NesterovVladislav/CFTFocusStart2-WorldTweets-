//
//  Header.h
//  control
//
//  Created by Nesterov on 03/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnumerationKeyAndValue.h"

@interface Header : NSObject<EnumerationKeyAndValue>

-(instancetype)init;

- (void)addValueForkey:(NSString *)object forKey:(NSString *)key;

@end
