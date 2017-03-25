//
//  AllertError.h
//  control
//
//  Created by Student on 25.03.17.
//  Copyright © 2017 CFT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllertError : UIView

- (instancetype)init;

- (UIAlertController *)getAllertWithError:(NSError *)error;

@end
