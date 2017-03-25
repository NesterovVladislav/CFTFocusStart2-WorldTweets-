//
//  Authorization.h
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EndAuthorization.h"

@interface Authorization : NSObject

@property( weak ) id< EndAuthorization > delegate;


@property (nonatomic, copy, readonly) NSString *apiKey;
@property (nonatomic, copy, readonly) NSString *apiSecret;

- (instancetype)initWithAPIKey:(NSString *)apiKey apiSecret:(NSString *)apiSecret;

- (void)request;

- (instancetype)init NS_UNAVAILABLE;

@end
