//
//  SuperParser.h
//  control
//
//  Created by Nesterov on 17/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseParserTwiter.h"
#import "ResponseParserAvtorization.h"
#import "ResponseParserDictionary.h"
#import "RequestContext.h"

@interface SuperParser : NSObject

- (instancetype)init;

- (id<Parser>)objectForKey:(ResultType)key;

@end
