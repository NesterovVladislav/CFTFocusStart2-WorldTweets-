//
//  Avtorization.h
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"

@interface TokenAuthorization : NSObject<Deserializeable>

@property (nonatomic, copy, readonly) NSString *token_type;
@property (nonatomic, copy, readonly) NSString *access_token;

- (instancetype)init;

@end



