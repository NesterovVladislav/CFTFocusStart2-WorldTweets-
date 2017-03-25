//
//  ErrorForParsingJSON.h
//  control
//
//  Created by Student on 18.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"

@interface ErrorForParsingJSON : NSObject<Deserializeable>

@property (nonatomic, copy, readonly) NSString *message;
@property (nonatomic, readonly) NSInteger code;

- (instancetype)init;

@end
