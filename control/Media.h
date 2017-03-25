//
//  Media.h
//  control
//
//  Created by Nesterov on 17/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"
#import <UIKit/UIKit.h>


@interface Media : NSObject<Deserializeable>

@property ( nonatomic, copy, readonly ) NSString *media_url_https;

- (instancetype)init;

@end
