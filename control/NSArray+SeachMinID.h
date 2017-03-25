//
//  NSArray+seachMinID.h
//  control
//
//  Created by Student on 20.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tweet.h"

@interface NSArray (SeachMinID)

+ (NSInteger)seachMinIDInArrayTweet:(NSArray<Tweet *> *) arrayTwiters;

@end
