//
//  Twite.h
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"
#import <UIKit/UIKit.h>
#import "User.h"
#import "Entities.h"
#import "Retweeted_status.h"

@interface Tweet : NSObject<Deserializeable>

@property (nonatomic, readonly) NSInteger id;
@property (nonatomic, readonly) NSInteger favorite_count;
@property (nonatomic, readonly) NSInteger retweet_count;

@property (nonatomic, copy, readonly) NSString *source;
@property (nonatomic, copy, readonly) NSString *lang;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy, readonly) NSString *created_at;

@property (nonatomic, strong, readonly) User *user;
@property (nonatomic, strong, readonly) Entities *entities;
@property (nonatomic,readonly) BOOL wasRetweet;

-(instancetype)init;

- (void)appendagwInformation;

@end
