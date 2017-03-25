//
//  HeightCell.h
//  control
//
//  Created by Nesterov on 23/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HeightCell : NSObject

@property (nonatomic, readonly) CGFloat height;

- (instancetype)initWithHeight:(CGFloat)height;

@end
