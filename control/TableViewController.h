//
//  TableViewController.h
//  control
//
//  Created by Student on 13.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "TokenAuthorization.h"
#import "LoadinfTwites.h"
#import "DelegateDatasourse.h"

@interface TableViewController : UIViewController<DelegateDatasourse>

- (instancetype)initWithArrayTweet:(NSArray<Tweet *> *)aData key:(TokenAuthorization *)key name:(NSString *)userName;

@end
