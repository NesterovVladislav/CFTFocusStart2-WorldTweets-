//
//  LoadinfTwites.m
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//
#import "LoadinfTwites.h"
#import "TokenAuthorization.h"
#import "NetWork.h"
#import "RequestContext.h"
#import "Tweet.h"
#import "Header.h"

@implementation LoadinfTwites
{
    NetWork *netWork;
    TokenAuthorization *authorization;
    Header *headerRequest;

    NSURLSession *session;
    NSString *paramURL;
    NSString *userName;
    NSInteger postCount;
    NSString *url;
}
- (instancetype)initWithAuthorizate:(TokenAuthorization *) keyAuth userName:(NSString *)aUserName countTweeta:(NSInteger) countTweets
{
    assert(nil != keyAuth);
    assert(nil != aUserName);
    assert(0!=countTweets);
    assert(NO == [aUserName isEqualToString:@""]);
    
    self = [super init];
    
    authorization = keyAuth;
    userName = [ aUserName copy];
    postCount = countTweets;
    headerRequest = [[ Header alloc] init];
    
    url = [self makeURL];
    
    return self;
}

- (NSString *)makeURL
{
    return [NSString stringWithFormat:@"%@%ld%@%@",@"https://api.twitter.com/1.1/statuses/user_timeline.json?count=", postCount, @"&screen_name=", userName];
}

- (void)createHeader
{
    [headerRequest addValueForkey:@"My Twitter App v1.0.23" forKey:@"User-Agent"];
    [headerRequest addValueForkey:[NSString stringWithFormat:@"Bearer %@", authorization.access_token] forKey:@"Authorization"];
    [headerRequest addValueForkey:@"gzip" forKey:@"Accept-Encoding"];
}

- (void)request
{
    netWork = [[NetWork alloc] init];
    
    [self createHeader];
    
    RequestContext *context = [[RequestContext alloc] initWithParametrs:url method:@"GET" header:headerRequest httpBody:nil expectedClass:[Tweet class] typeResult:ResultTypeTwiter];
    
    typeof(self) __weak weakSelf = self;
    
    [netWork requestContext:context complition:^(NSError *error, id data)
    {
        [weakSelf handleData:data error:error];
    }];
}

- (void)requestNextTweetsWithMaxID:(NSInteger)maxID
{
    url = [self makeURL];
    url = [NSString stringWithFormat:@"%@%@%ld", url, @"&max_id=", maxID];
    [self request];
}

- (void)requestPullToRefreshID:(NSInteger)idTweet
{
    url = [self makeURL];
    url = [NSString stringWithFormat:@"%@%@%ld", url, @"&since_id=", idTweet];
    [self request];
}

- (void)handleData:(NSData*)data error:(NSError *)error
{
    if( error != nil )
    {
        [self.delegate finishLoadTweet:nil error:error];
    }
    else
    {
        NSArray<Tweet *> *result = (NSArray<Tweet *> *)data;
        [result enumerateObjectsUsingBlock:^(Tweet * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
        {
            [obj appendagwInformation];
        }];
        [self.delegate finishLoadTweet:result error:nil];
    }
}

- (instancetype)init
{
    assert(NO);
    return nil;
}

@end
