//
//  User.h
//  control
//
//  Created by Student on 15.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"
#import <UIKit/UIKit.h>

@interface User : NSObject<Deserializeable>

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *screen_name;
@property (nonatomic, strong, readwrite) UIImage *imageUser;

- (instancetype)init;

- (void)addImageUserOrRetweetUser:(BOOL)userOrRetweetUser nameUser:(NSString *)name;
@end
