//
//  EndAuthorization.h
//  control
//
//  Created by Student on 13.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TokenAuthorization.h"

@protocol EndAuthorization <NSObject>

- (void)finishAuthorization:(TokenAuthorization *)authorize error:(NSError *)error;

@end
