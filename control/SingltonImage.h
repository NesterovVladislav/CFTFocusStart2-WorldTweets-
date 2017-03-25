//
//  SingltonImage.h
//  control
//
//  Created by Nesterov on 16/03/17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SingltonImage : NSObject

+ (SingltonImage *)sharedInstanceWithImageURL:(NSString *)imageUrl userName:(NSString *)userName;
- (UIImage *)getImage;

@end
