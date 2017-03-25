//
//  Retweeted_status.h
//  control
//
//  Created by Nesterov on 16/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"
#import "User.h"
#import "Entities.h"

@interface RetweetedStatus : NSObject<Deserializeable>

@property (nonatomic, strong, readonly) User *user;
@property (nonatomic, strong, readonly) Entities *entities;
@property (nonatomic, copy, readonly) NSString *text;

-(instancetype)init;

@end
