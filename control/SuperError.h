//
//  SuperError.h
//  control
//
//  Created by Nesterov on 17/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorForParsingJSON.h"
#import "Deserializeable.h"

@interface SuperError : NSObject<Deserializeable>

@property(nonatomic, copy, readonly) NSString *error;
@property(nonatomic, strong, readonly) ErrorForParsingJSON * errors;

- (instancetype)init;

- (NSError *)convertToNSError;

@end
