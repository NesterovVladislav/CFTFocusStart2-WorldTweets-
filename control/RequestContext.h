//
//  RequestContext.h
//  Animation
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Header.h"

typedef NS_ENUM(NSInteger, ResultType)
{
    ResultTypeAvtorization = 0,
    ResultTypeTwiter,
    ResultTypeDictionary
};

@interface RequestContext : NSObject

@property (nonatomic, copy, readonly) NSString *url;
@property (nonatomic,copy, readonly) NSString *httpMethod;
@property (nonatomic,copy, readonly) NSString *userAgent;
@property (nonatomic,copy, readonly) NSString *authorization;
@property (nonatomic,copy, readonly) NSString *contentType;
@property (nonatomic,copy, readonly) NSString *acceptEncoding;
@property (nonatomic, strong, readonly) NSData *httpBody;
@property (nonatomic, strong, readonly) Header *headerRequest;
@property (nonatomic, strong, readonly) Class expectedClass;
@property (nonatomic, readonly) ResultType typeResult;

- (instancetype)initWithParametrs:(NSString *)url method:(NSString *)method header:(Header *)headerRequest httpBody:(NSData *)httpBody expectedClass:(Class)class typeResult:(ResultType) type;

- (instancetype) init NS_UNAVAILABLE;

@end
