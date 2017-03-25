//
//  Urls.h
//  control
//
//  Created by Nesterov on 24/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"

@interface Urls : NSObject<Deserializeable>

@property (nonatomic, copy, readonly) NSString *display_url;
@property (nonatomic, copy, readonly) NSString *url;
@property (nonatomic, copy, readonly) NSString *expanded_url;

- (instancetype)init;

@end
