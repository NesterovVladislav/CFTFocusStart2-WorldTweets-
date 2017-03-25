//
//  Entities.h
//  control
//
//  Created by Nesterov on 17/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Media.h"
#import "Deserializeable.h"
#import "Urls.h"


@interface Entities : NSObject<Deserializeable>

@property (nonatomic, strong, readonly) Media *media;
@property (nonatomic, strong, readonly) Urls *urls;

- (instancetype)init;

@end
