//
//  Authorization.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//
#import "Authorization.h"
#import "TokenAuthorization.h"
#import "NetWork.h"
#import "RequestContext.h"
#import "LoadinfTwites.h"
#import "Header.h"

@interface Authorization()<NSURLSessionDelegate>

@end

@implementation Authorization
{
    NetWork *netWork;
    LoadinfTwites *loadTwite;
    Header *headerRequest;
    
    NSURLSession *session;
    NSString *paramURL;
    NSString *authorization;
}
- (instancetype)initWithAPIKey:(NSString *)apiKey apiSecret:(NSString *)apiSecret
{
    assert(nil != apiKey);
    assert(nil != apiSecret);
    assert(NO == [apiKey isEqualToString:@""]);
    assert(NO == [apiSecret isEqualToString:@""]);

    self = [super init];
    
    _apiKey = [apiKey copy];
    _apiSecret = [apiSecret copy];
    
    headerRequest = [[Header alloc] init];
    
    return self;
}

- (void)creatAuthorization
{
    paramURL = [NSString stringWithFormat:@"%@:%@", _apiKey, _apiSecret];
    NSData *dataParamURL = [paramURL dataUsingEncoding:NSUTF8StringEncoding];
    paramURL = [dataParamURL base64EncodedStringWithOptions:0];
    
    authorization = [NSString stringWithFormat:@"Basic %@", paramURL] ;
}

- (void)createHeader
{
    [headerRequest addValueForkey:@"My Twitter App v1.0.23" forKey:@"User-Agent"];
    [headerRequest addValueForkey:authorization forKey:@"Authorization"];
    [headerRequest addValueForkey:@"application/x-www-form-urlencoded;charset=UTF-8" forKey:@"Content-Type"];
    [headerRequest addValueForkey:@"gzip" forKey:@"Accept-Encoding"];
}

- (void)request
{
    [self creatAuthorization];
    [self createHeader];
    
    netWork = [[NetWork alloc]init];
    
    RequestContext *context = [[RequestContext alloc] initWithParametrs
                               :@"https://api.twitter.com/oauth2/token" method:@"POST" header:headerRequest httpBody:[@"grant_type=client_credentials" dataUsingEncoding:NSUTF8StringEncoding] expectedClass:[TokenAuthorization class] typeResult:ResultTypeAvtorization ];
    
    typeof(self) __weak weakSelf = self;
    
    [netWork requestContext:context complition:^(NSError *error, id data)
    {
        [weakSelf handleData:data error:error];
    }];
}

- (void)handleData:(NSData*)data error:(NSError *)error
{
    if( error != nil )
    {
        [self.delegate finishAuthorization:nil error:error];
    }
    else{
        
        TokenAuthorization *tokkenKey = (TokenAuthorization *)data;
        [self.delegate finishAuthorization:tokkenKey error:nil];
    }
}

- (instancetype)init
{
    assert(NO);
    return nil;
}

@end
