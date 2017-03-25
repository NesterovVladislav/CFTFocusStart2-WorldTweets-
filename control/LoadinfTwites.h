//
//  LoadinfTwites.h
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TokenAuthorization.h"
#import "EndLoadTwite.h"

@interface LoadinfTwites : NSObject

@property(weak) id<EndLoadTwite> delegate;


- (instancetype)initWithAuthorizate:(TokenAuthorization *)keyAuth userName:(NSString *)aUserName countTweeta:(NSInteger) countTweets;

- (void)request;
- (void)requestNextTweetsWithMaxID:(NSInteger)maxID;
- (void)requestPullToRefreshID:(NSInteger)idTweet;

- (instancetype)init NS_UNAVAILABLE;

@end
