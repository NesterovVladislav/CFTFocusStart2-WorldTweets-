//
//  DataSoure.h
//  control
//
//  Created by Student on 13.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "TokenAuthorization.h"
#import "LoadinfTwites.h"
#import "EndLoadTwite.h"
#import "DelegateDatasourse.h"



@interface DataSoure : NSObject< UITableViewDataSource, UITableViewDelegate, EndLoadTwite>

@property (nonatomic, readonly) Tweet *selectTwite;
@property (weak) id<DelegateDatasourse> delegate;

- (instancetype)initWithArrayTweet:(NSArray<Tweet *> *)aData key:(TokenAuthorization *)key name:(NSString *)userName;

- (void)refreshDate;

- (instancetype)init NS_UNAVAILABLE;

@end
