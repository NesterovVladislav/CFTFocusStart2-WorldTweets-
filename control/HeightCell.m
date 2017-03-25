//
//  HeightCell.m
//  control
//
//  Created by Nesterov on 23/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import "HeightCell.h"

@interface HeightCell()

@property (nonatomic, readwrite) CGFloat height;

@end

@implementation HeightCell
{
}
- (instancetype)initWithHeight:(CGFloat)height
{
    self = [super init];
    
    _height = height;
    
    return self;
}

@end
