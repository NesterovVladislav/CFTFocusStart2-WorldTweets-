//
//  ViewController.h
//  control
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppContext.h"
#import "EndAuthorization.h"
#import "EndLoadTwite.h"


@interface ViewController : UIViewController<EndAuthorization, EndLoadTwite>

@property (nonatomic, strong, readonly) AppContext *appContext;

- (instancetype)initWithAppContext:(AppContext *)anAppContext;

@end
