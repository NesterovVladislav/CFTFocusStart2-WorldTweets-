//
//  delegateDatasourse.h
//  control
//
//  Created by Nesterov on 17/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DelegateDatasourse <NSObject>

- (void)startNextLoadingTweets;
- (void)endNextLoadingTweetsWithError:(NSError *)error;
- (void)endRefreshTweetsWithError:(NSError *)error;
- (void)didLoadImageForIndex:(NSIndexPath *)indexPath;

@end
