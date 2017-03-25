//
//  Parser.h
//  Animation
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Parser <NSObject>

- (id)parserResponse:(id)json expected:(Class)class;

@end
