//
//  EndLoadTwite.h
//  control
//
//  Created by Student on 13.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tweet.h"

@protocol EndLoadTwite <NSObject>

- (void)finishLoadTweet:(NSArray<Tweet * > *)data error:(NSError *)error;

@end
