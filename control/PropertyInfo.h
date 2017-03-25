//
//  PropertyInfo.h
//  control
//
//  Created by Student on 15.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertyInfo : NSObject

@property (nonatomic, copy, readwrite) NSString *method;
@property (nonatomic, strong, readwrite) Class class;

- (instancetype)initWithMethod:(NSString *)method className:(Class)className;

- (instancetype)init NS_UNAVAILABLE;

@end
